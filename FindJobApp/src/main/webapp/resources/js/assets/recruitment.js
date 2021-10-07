/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function enableRecruitment(recId, status) {
    if (status === 'active') {
        if (confirm("Ẩn bài viết?") == true) {
            fetch(`/FindJobApp/api/admin/recruitment/inactive/${recId}`, {
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

    if (status === 'inactive') {
        if (confirm("Kích hoạt bài viết?") == true) {
            fetch(`/FindJobApp/api/admin/recruitment/active/${recId}`, {
                method: "get",
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => {
                if (res.status == 200) {
                    location.reload();
                } else
//                    alert("Something wrong!!!");
                    alert(res.status);
            })
        }
    }
}

function deleteRecruitment(recId) {
    if (confirm("Xóa bài viết?") == true) {
        fetch(`/FindJobApp/api/admin/recruitment/${recId}`, {
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