window.addEventListener('DOMContentLoaded', () => {
    const addForm = window.document.getElementById('add-form');
    addForm['colorAdd'].addEventListener('click', () => {
        console.log('click');

        const colorName = addForm['colorName'].value;
        const sizeName = addForm['sizeName'].value;
        const colorPremium = addForm['colorPremium'].value;
        console.log(addForm['colorName'].value);
        // 2500
        const select = addForm['options'];
        const option = window.document.createElement('option');
        option.innerText = `${colorName}|${sizeName}|${colorPremium}`;
        select.append(option);

        addForm['colorName'].value = '';
        addForm['colorPremium'].value = '';
        addForm['colorName'].focus();
    });
    addForm['colorDelete'].addEventListener('click', () => {
        const select = addForm['options'];
        const options = select.querySelectorAll('option:checked');
        if (options.length === 0) {
            alert('삭제할 색상 옵션을 선택해주세요.');
            return;
        }
        if (confirm(`정말로 선택한 ${options.length}개의 색상 옵션을 제거할까요?`)) {
            for (let i = options.length - 1; i >= 0; i--) {
                if (options[i].selected) {
                    options[i].remove();
                }
            }
        }
    });

    addForm.onsubmit = () => {
        ['options'].forEach(name => {
            addForm[name].querySelectorAll('option').forEach(option => {
                option.setAttribute("selected", "selected");
            });
        });
    };
});