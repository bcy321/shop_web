package com.bcyportfolio.shopping.services;


import com.bcyportfolio.shopping.dtos.*;
import com.bcyportfolio.shopping.enums.product.*;
import com.bcyportfolio.shopping.mappers.IProductMapper;
import com.bcyportfolio.shopping.vos.product.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;

@Service
public class ProductService {
    private static class Config {
        public static final int PRODUCT_PER_PAGE = 5;
        public static final int PAGE_RANGE = 5;
    }

    private final IProductMapper productMapper;

    @Autowired
    public ProductService(IProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    public static boolean isAllowedToWrite(UserDto user) {
        return user.getLevel() == 1;
    }

    public ArrayList<CategoryDto> getCategories() {
            return this.productMapper.selectCategories();
    }

    public CategoryDto getCategory(String cid) {
        return this.productMapper.selectCategory(cid);
    }

    public CategoryDto getCategory(int iid) {
        return this.productMapper.selectCategoryByProduct(iid);
    }

    public void deleteProduct(DeleteVo deleteVo) {
        CategoryDto category = this.getCategory(deleteVo.getItemId());
        if (category == null) {
            deleteVo.setResult(DeleteResult.NO_SUCH_PRODUCT);
            return;
        }
        if (!ProductService.isAllowedToWrite(deleteVo.getUser())) {
            deleteVo.setResult(DeleteResult.NOT_AUTHORIZED);
            return;
        }
        this.productMapper.deleteProduct(deleteVo.getItemId());
        deleteVo.setCategory(category);
        deleteVo.setResult(DeleteResult.OKAY);
    }
    public void getProducts(ListVo listVo) {
        if (listVo.getCategory() == null) {
            listVo.setResult(ListResult.NO_SUCH_PRODUCT);
            return;
        }
        int itemCount = this.productMapper.selectProductCount(listVo.getCategoryId());
        int maxPage = itemCount / Config.PRODUCT_PER_PAGE + (itemCount % Config.PRODUCT_PER_PAGE == 0 ? 0 : 1);
        int leftPage = Math.max(1, listVo.getPage() - Config.PAGE_RANGE);
        int rightPage = Math.min(maxPage, listVo.getPage() + Config.PAGE_RANGE);
        listVo.setMaxPage(maxPage);
        listVo.setLeftPage(leftPage);
        listVo.setRightPage(rightPage);

        ArrayList<ProductDto> products = this.productMapper.selectProducts(
                listVo.getCategoryId(),
                Config.PRODUCT_PER_PAGE * (listVo.getPage() - 1),
                Config.PRODUCT_PER_PAGE);

        for(ProductDto product : products) {
            product.setOptions(this.productMapper.selectOptions(product.getIndex()));
        }
        listVo.setProducts(products);
        listVo.setResult(ListResult.OKAY);
    }
    public void searchProducts(SearchVo searchVo) {
        if (searchVo.getCategory() == null) {
            searchVo.setResult(ListResult.NO_SUCH_PRODUCT);
            return;
        }

        int productCount;
        if ("content".equals(searchVo.getCriteria())) {
            productCount = this.productMapper.selectProductCountByContent(searchVo.getCategoryId(), searchVo.getKeyword());
        } else {
            productCount = this.productMapper.selectProductCountByName(searchVo.getCategoryId(), searchVo.getKeyword());
        }
        int maxPage = productCount / Config.PRODUCT_PER_PAGE + (productCount % Config.PRODUCT_PER_PAGE == 0 ? 0 : 1);
        int leftPage = Math.max(1, searchVo.getPage() - Config.PAGE_RANGE);
        int rightPage = Math.min(maxPage, searchVo.getPage() + Config.PAGE_RANGE);
        searchVo.setMaxPage(maxPage);
        searchVo.setLeftPage(leftPage);
        searchVo.setRightPage(rightPage);

        ArrayList<ProductDto> products;
        //TODO : java.sql.SQLDataException: Cannot convert string 'content' to java.sql.Timestamp
        if ("content".equals(searchVo.getCriteria())) {
            products = this.productMapper.selectProductsByContent(
                    searchVo.getCategoryId(),
                    Config.PRODUCT_PER_PAGE * (searchVo.getPage() - 1),
                    Config.PRODUCT_PER_PAGE,
                    searchVo.getKeyword());
        } else {
            products = this.productMapper.selectProductsByName(
                    searchVo.getCategoryId(),
                    Config.PRODUCT_PER_PAGE * (searchVo.getPage() - 1),
                    Config.PRODUCT_PER_PAGE,
                    searchVo.getKeyword());
        }
        for(ProductDto product : products) {
            product.setOptions(this.productMapper.selectOptions(product.getIndex()));
        }

        searchVo.setProducts(products);
        searchVo.setResult(ListResult.OKAY);
    }
    public void read(ReadVo readVo) {
        CategoryDto category = this.getCategory(readVo.getItemId());
        if (category == null) {
            readVo.setResult(ReadResult.NO_SUCH_PRODUCT);
            return;
        }
        ProductDto product = this.productMapper.selectProduct(readVo.getItemId());
        product.setOptions(this.productMapper.selectOptions(readVo.getItemId()));
        readVo.setProduct(product);
        readVo.setCategory(category);
    }
    public void addProduct(AddVo addVo) throws IOException {
        if (addVo.getCategory() == null){
            addVo.setResult(AddResult.NO_SUCH_PRODUCT);
            return;
        }
        if (!ProductService.isAllowedToWrite(addVo.getUser())) {
            addVo.setResult(AddResult.NOT_AUTHORIZED);
            return;
        }
        this.productMapper.insertProduct(
                addVo.getCategory(),
                addVo.getName(),
                addVo.getPrice(),
                addVo.getImage().getBytes(),
                addVo.getContent()
        );

        int itemIndex =this.productMapper.selectLastInsertId();
//        System.out.println(itemIndex + " " + Arrays.toString(addVo.getOptions()));
        for(String option : addVo.getOptions()) {
            String[] optionArray = option.split("[|]");
            if (optionArray.length == 3) {
                String colorOption = optionArray[0];
                String sizeOption = optionArray[1];
                int stock = Integer.parseInt(optionArray[2]);
                this.productMapper.insertOption(itemIndex,colorOption,sizeOption,stock);
            }
        }
        addVo.setResult(AddResult.OKAY);
    }

    public void prepareEditing(EditPreparationVo editPreparationVo) {
        CategoryDto category = this.getCategory(editPreparationVo.getItemId());
        if (category == null) {
            editPreparationVo.setResult(EditResult.NO_SUCH_PRODUCT);
            return;
        }
        if (!ProductService.isAllowedToWrite(editPreparationVo.getUser())) {
            editPreparationVo.setResult(EditResult.NOT_AUTHORIZED);
            return;
        }
        ProductDto product = this.productMapper.selectProduct(editPreparationVo.getItemId());
        product.setOptions(this.productMapper.selectOptions(editPreparationVo.getItemId()));
        editPreparationVo.setProduct(product);
        editPreparationVo.setResult(EditResult.OKAY);
    }
    public void editProduct(EditVo editVo) throws IOException {
        CategoryDto category = this.getCategory(editVo.getItemId());
        if (category == null) {
            editVo.setResult(EditResult.NO_SUCH_PRODUCT);
            return;
        }
        if (!ProductService.isAllowedToWrite(editVo.getUser())) {
            editVo.setResult(EditResult.NOT_AUTHORIZED);
            return;
        }
        this.productMapper.updateProduct(
                editVo.getItemId(),
                editVo.getCategory(),
                editVo.getName(),
                editVo.getPrice(),
                editVo.getImage().getBytes(),
                editVo.getContent()
        );
        this.productMapper.deleteProductOption(editVo.getItemId());
        for(String option : editVo.getOptions()) {
            String[] optionArray = option.split("[|]");
            if (optionArray.length == 3) {
                String colorOption = optionArray[0];
                String sizeOption = optionArray[1];
                int stock = Integer.parseInt(optionArray[2]);
                this.productMapper.insertOption(editVo.getItemId(),colorOption,sizeOption,stock);
            }
        }
        editVo.setResult(EditResult.OKAY);
    }
    public void PrepareOrder(OrderPreparationVo orderPreparationVo){
        if(orderPreparationVo.getUser().getLevel() > 9){
            orderPreparationVo.setResult(OrderResult.FAILURE);
            return;
        }
        ProductDto product = this.productMapper.selectProduct(orderPreparationVo.getItemId());
        product.setOptions(this.productMapper.selectOptions(orderPreparationVo.getItemId()));
//        System.out.println(product.getOptions().get(1).getColorOption());

        orderPreparationVo.setProduct(product);
        orderPreparationVo.setResult(OrderResult.SUCCESS);


    }
    public void order(OrderVo orderVo){
        if(orderVo.getUser().getLevel() > 9){
            orderVo.setResult(OrderResult.FAILURE);
            return;
        }
        ProductDto product = this.productMapper.selectProduct(orderVo.getItemId());
        orderVo.setProduct(product);
        orderVo.getProduct().setOptions(this.productMapper.selectOptions(orderVo.getItemId()));
        int stock = this.productMapper.selectOptionStock(orderVo.getItemId(), orderVo.getColorOption(), orderVo.getSizeOption());

        if(stock < orderVo.getStock()){
            orderVo.setResult(OrderResult.FAILURE);
            return;
        }
//        System.out.println("service : "+orderVo.getItemId());
        this.productMapper.insertOrder(
                orderVo.getItemId(),
                orderVo.getUser().getEmail(),
                orderVo.getColorOption(),
                orderVo.getSizeOption(),
                orderVo.getStock(),
                orderVo.getUser().getAddressPost(),
                orderVo.getUser().getAddressPrimary(),
                orderVo.getUser().getAddressSecondary(),
                orderVo.getContent()
        );
        this.productMapper.updateOptionStock(orderVo.getItemId(), orderVo.getColorOption(), orderVo.getSizeOption(), stock- orderVo.getStock());
        orderVo.setResult(OrderResult.SUCCESS);
    }

    public void orderList(OrderListVo orderVo){

        ArrayList<OrderDto> orders = this.productMapper.selectOrderList(orderVo.getUser().getEmail());
        orderVo.setOrders(orders);
    }

    public ArrayList<Integer> mainByImages(){
        ArrayList<Integer>  randomIndexArrays = this.productMapper.selectMainByImages();
        return randomIndexArrays;
    }
}