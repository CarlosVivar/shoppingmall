/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function rnd() {
    return Math.random();
};
function checkKeyword() {
    var keyword = $('[name=keyword]').val();
    if(keyword.length == 0) {
        alert('Bạn chưa nhập từ khóa!!!');
        $('name=keyword').focus();
        return false;
    }
    return true;
};
function getSanPham(cID, rowsPerPage, currPage) {
    $.get('sanpham_ajax.jsp', {cID: cID, rowsPerPage: rowsPerPage, currPage: currPage, sid: rnd()},
        function(data) {
            $('#products_content').html(data);//alert(data);
        }
    );
};
function getTimKiemSP(cID, rowsPerPage, currPage) {
    $.get('timkiem_ajax.jsp', {cID: cID, rowsPerPage: rowsPerPage, currPage: currPage, sid: rnd()},
        function(data) {
            $('#search_content').html(data);//alert(data);
        }
    );
};
function getTimKiemSPNC(currPage) {
    $.post('timkiemnangcao_ajax.jsp?currPage=' + currPage + "&sid" + rnd(), $('#advsearch_form').serialize(),
        function(data) {
            $('#search_content').html(data);//alert(data);
        }
    );
};
function getSPKhuyenMai(rowsPerPage, currPage) {
    $.get('khuyenmai_ajax.jsp', {rowsPerPage: rowsPerPage, currPage: currPage, sid: rnd()},
        function(data) {
            $('#promotion_content').html(data);
        }
    );
};
//them san pham vao gio hang
function addCart() {
    $.post('u2c_Cart?action=addCart&sid=' + rnd(), $('#shopping_cart').serialize(),
        function() {
            $('#login_content').load('login.jsp?sid=' + rnd());
            if(confirm('Bạn đã đưa sản phẩm bạn chọn vào giỏ hàng!'))
                return;
            else
                return;
        }
    );
};
//cap nhat gio hang
function updateCart() {
    $.post('u2c_Cart?action=updateCart&sid=' + rnd(), $('#shopping_cart').serialize(),
        function(data) {
            $('#login_content').load('login.jsp?sid=' + rnd());
            $('#cart_content').html(data);
        }
    );
};
//check username
function checkUsername() {
    var username = $('[name=username]').val();
    $.get('dangky_checkform.jsp', {action: 'cUser', username: encodeURIComponent(username), sid: rnd()},
        function(data) {
            $('#error_username').html(data);
        }
    );
}
//check so CMND
function checkCMND() {
    var cmnd = $('[name=cmnd]').val();
    $.get('dangky_checkform.jsp', {action: 'cCMND', cmnd: encodeURIComponent(cmnd), sid: rnd()},
        function(data) {
            $('#error_cmnd').html(data);//alert(data);
        }
    );
}
//check password
function checkPassword() {
    var pwdOld = $('[name=pwdOld]').val();
    $.get('dangky_checkform.jsp', {action: 'cPwd', pwd: encodeURIComponent(pwdOld), sid: rnd()},
        function(data) {
            $('#error_pwdOld').html(data);
        }
    );
}
//go back
function goback() {
    history.back(-1);
}
//check email
function checkEmail(email) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (filter.test(email))
        return true;
    return false;
}

//form de viet nhan xet
function getNhanXet(maSP) {
    $.get('nhanxet.jsp', {action: 'newNX', MaSP: maSP, sid: rnd()},
        function(data) {
            $('#dialog').html(data);//alert(data);
            $('#dialog').dialog('open');
        }
    );
    return false;
}
function cancelNhanXet() {
    $('#dialog').dialog('close');
}

//kiem tra tinh trang login hay chua?
function check_login(user) {
    alert(user);
    return false;
}

//
function getCaptcha() {
    $.get('captcha.jsp', {action: 'newCap', sid: rnd()},
        function(data) {
            $('#captcha_img').html(data);
        }
    );
    return false;
}
function checkCaptcha() {
    error = false;
    $.get('captcha.jsp?action=submitCap', {answer: $('[name=tbanswer]').val(), sid: rnd()},
        function(data) {
            $('#error_answer').html(data);//alert(data);
        }
    );
}