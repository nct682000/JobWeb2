/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function enableApply(applyId, status) {
    if (status === 'active') {
        if (confirm("Ẩn thư ứng tuyển?") == true) {
            fetch(`/FindJobApp/api/admin/apply/inactive/${applyId}`, {
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
        if (confirm("Kích hoạt lại thư ứng tuyển?") == true) {
            fetch(`/FindJobApp/api/admin/apply/active/${applyId}`, {
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

function deleteApply(applyId) {
    if (confirm("Xóa thư ứng tuyển?") == true) {
        fetch(`/FindJobApp/api/admin/apply/${applyId}`, {
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