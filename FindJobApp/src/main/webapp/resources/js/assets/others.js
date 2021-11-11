/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function deleteTag(id) {
    if (confirm("Xóa tag?") == true) {
        fetch(`/FindJobApp/api/admin/tag/${id}`, {
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

function deleteBenefit(id) {
    if (confirm("Xóa Phúc lợi?") == true) {
        fetch(`/FindJobApp/api/admin/benefit/${id}`, {
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

function deleteCareer(id) {
    if (confirm("Xóa nghề nghiệp?") == true) {
        fetch(`/FindJobApp/api/admin/career/${id}`, {
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