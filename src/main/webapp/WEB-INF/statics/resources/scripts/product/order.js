window.addEventListener('DOMContentLoaded', () => {
    const orderForm = window.document.getElementById('orderForm');
    orderForm['addressPostFindButton'].addEventListener('click', () => {
        new daum.Postcode({
            oncomplete: (data) => {
                orderForm['addressPost'].value = data['zonecode'];
                orderForm['addressPrimary'].value = data['address'];
                orderForm['addressSecondary'].value = '';
                orderForm['addressSecondary'].focus();
            }
        }).open();
    });


    const selectElem = document.getElementById('color')
    const pElem = document.getElementById('stockOption')
    let index = 0;
    selectElem.addEventListener('change', ()=> {
        index = selectElem.selectedIndex;
        console.log(index);
        pElem.dataset.tile = index;

    })


    orderForm.onsubmit = () => {
       alert('주문 완료 되었습니다.');
    };
});