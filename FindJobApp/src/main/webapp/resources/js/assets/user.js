/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function enableUser(userId, typeUser, status) {
    if (typeUser === 'cadidates' && status === 'active') {
        if (confirm("Khóa tài khoản người dùng?") == true) {
            fetch(`/FindJobApp/api/admin/customers/cadidates/${userId}`, {
                method: "get",
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => {
                if (res.status == 200) {
                    location.reload();
                } else
                    alert("Something wrong!!!");
            })
        }
    }
    
    if (typeUser === 'cadidates' && status === 'inactive') {
        if (confirm("Kích hoạt tài khoản người dùng?") == true) {
            fetch(`/FindJobApp/api/admin/customers/cadidates/inactive/${userId}`, {
                method: "get",
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => {
                if (res.status == 200) {
                    location.reload();
                } else
                    alert("Something wrong!!!");
            })
        }
    }
    
    if (typeUser === 'recruiters' && status === 'active') {
        if (confirm("Khóa tài khoản người dùng?") == true) {
            fetch(`/FindJobApp/api/admin/customers/recruiters/${userId}`, {
                method: "get",
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => {
                if (res.status == 200) {
                    location.reload();
                } else
                    alert("Something wrong!!!");
            })
        }
    }
    
    if (typeUser === 'recruiters' && status === 'inactive') {
        if (confirm("Kích hoạt khoản người dùng?") == true) {
            fetch(`/FindJobApp/api/admin/customers/recruiters/inactive/${userId}`, {
                method: "get",
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => {
                if (res.status == 200) {
                    location.reload();
                } else
                    alert("Something wrong!!!");
            })
        }
    }
}

function deleteUser(userId) {
    if (confirm("Xóa tài khoản người dùng?") == true) { 
        fetch(`/FindJobApp/api/admin/customers/${userId}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if (res.status == 200) {
                location.reload();
            } else 
                alert("Something wrong!!!");
        })
    }
}