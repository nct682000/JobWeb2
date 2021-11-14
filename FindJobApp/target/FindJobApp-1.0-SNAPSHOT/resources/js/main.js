/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = function () {
    let dates = document.querySelectorAll(".my-date")
    for (let i = 0; i < dates.length; i++) {
        let d = dates[i]
        moment.locale('vi')
        d.innerText = moment(d.innerText).fromNow()
    }
}

function addComment(commenterId, commentedId){
    fetch("/FindJobApp/api/add-comment", {
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById("commentId").value,
            "commenterId": commenterId,
            "commentedId": commentedId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res){
        console.info(res)
        return res.json()
    }).then(function(data){
        console.info(data)
        console.info(data.id)
        
        let area =  document.getElementById("commentArea")
        let name = document.getElementById("cmtName").value
        let avatar = document.getElementById("cmtAvatar").value
        console.info(name)
        console.info(avatar)
        
        moment.locale('vi')
        area.innerHTML = `
        <div class="mt-2 row" id="comment-${data.id}">
            <div class="col-md-2 text-center">
                <img alt="Avatar" src="${avatar}" class="img-fluid rounded"/>
            </div>
            <div class="col-md ml-2">
                <div class="card">
                    <div class="font-weight-bold">
                        ${name}
                    </div>
                    <div class="ml-3">${data.content}</div>
                </div>
                <div>
                    <span class="dropdown">
                        <button class="btn btn-sm dropdown-toggle text-primary font-weight-bold" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Thích
                        </button>
                        <div class="dropdown-menu font-weight-bold font-italic" aria-labelledby="dropdownMenuButton">
                                <div><a href="#" class="text-primary" onclick="addInteraction(0, ${commenterId}, ${data.id})"><i class="fa fa-thumbs-up"></i> Thích</a></div>
                                <div><a href="#" class="text-danger" onclick="addInteraction(1, ${commenterId}, ${data.id})"><i class="fa fa-thumbs-down"></i> Không thích</a></div>
                        </div>
                    </span>
                    <span class="dropdown">
                        <button class="btn btn-sm dropdown-toggle text-primary font-weight-bold" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Trả lời
                        </button>
                        <div class="dropdown-menu font-weight-bold font-italic" aria-labelledby="dropdownMenuButton">
                            <textarea id="replyContent-${data.id}" type="text" placeholder="Nhập trả lời..." class="form-control p-2 mt-2 col" ></textarea>
                            <div class="text-right mr-2"><a href="#" class="text-info" onclick="addReply(${commenterId}, ${data.id})"><button class="btn btn-primary">Trả lời</button></a></div>
                        </div>
                    </span>
                    <span class="text-secondary my-date">Lúc: ${moment(data.createdDate).fromNow()}</span>
                    <span class="btn btn-danger" onclick="deleteComment(${commenterId}, ${data.id})">Xóa</span>
                </div>
            </div>

        </div>
        ` + area.innerHTML
    }).then (function(empty){
        document.getElementById("commentId").value = ""
//        location.reload()
    })
}

function deleteComment(userId, commentId){
    if(confirm("Xác nhận xóa bình luận này") == true){
        fetch("/FindJobApp/api/delete-comment", {
            method: 'delete',
            body: JSON.stringify({
                "userId": userId,
                "commentId": commentId
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function(hidden){
            console.info(hidden)
            let c = document.getElementById(`comment-${commentId}`)
            c.style.display = "none"
        })
    }
}

function addReply(replyerId, commentId){
    fetch("/FindJobApp/api/add-reply", {
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById(`replyContent-${commentId}`).value,
            "replyerId": replyerId,
            "commentId": commentId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res){
        location.reload()
//        console.info(res)
//        return res.json()
    }).then(function(data){
//        console.info(data)
//        console.info(data.id)
//        
//        let area =  document.getElementById(`replyArea-${commentId}`)
//        let name = document.getElementById("cmtName").value
//        let avatar = document.getElementById("cmtAvatar").value
//        console.info(name)
//        console.info(avatar)
//        
//        moment.locale('vi')
//        area.innerHTML = `
//        <div class="ml-5 mt-2 row bg-light" id="reply-${data.id}">
//            <div class="col-2 text-center">
//                <img alt="Avatar" src="${avatar}" class="img-fluid rounded"/>
//            </div>
//            <div class="col-10">
//                <div class="card">
//                    <div class="font-weight-bold">
//                        ${name}
//                    </div>
//
//                    <div class="pl-3">${data.content}</div>
//                </div>
//                <div>
//                    <span><a href="#">Thích</a> . </span>
//                    <span class="text-secondary my-date">Lúc: ${moment(data.createdDate).fromNow()}</span>
//                    <span class="btn btn-danger">Xóa</span>
//                </div>
//            </div>
//        </div>
//        ` + area.innerHTML
    }).then(function(empty){
//        document.getElementById(`replyContent-${commentId}`).value = ""
    })
}

function deleteReply(userId, replyId){
    if(confirm("Xác nhận xóa trả lời này") == true){
        fetch("/FindJobApp/api/delete-reply", {
            method: 'delete',
            body: JSON.stringify({
                "userId": userId,
                "replyId": replyId
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function(hidden){
            console.info(hidden)
            let r = document.getElementById(`reply-${replyId}`)
            r.style.display = "none"
        })
    }
}
    
function addRate(canId, recId){
    fetch("/FindJobApp/api/add-rate", {
        method: 'post',
        body: JSON.stringify({
            "point": document.getElementById("ratePoint").innerText,
            "canId": canId,
            "recId": recId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    
    }).then(function(data){
        location.reload()
    })
}

function addInteraction(type, userId, commentId){
    fetch("/FindJobApp/api/add-interaction", {
        method: 'post',
        body: JSON.stringify({
            "type": type,
            "userId": userId,
            "commentId": commentId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    
    }).then(function(data){
        location.reload()
    })
}

function switchActiveRecruitment(recId){
    fetch("/FindJobApp/api/switch-active-recruitment", {
        method: 'post',
        body: JSON.stringify({
            "recId": recId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res){
        console.info(res)
        let iconShow = document.getElementById(`icon-active-show-${recId}`)
        let iconHide = document.getElementById(`icon-active-hide-${recId}`)
        let btnShow = document.getElementById(`btn-active-show-${recId}`)
        let btnHide = document.getElementById(`btn-active-hide-${recId}`)
        
        if(btnHide != null){
            if(btnHide.style.backgroundColor == "rgb(220, 53, 69)"){
                btnHide.style.backgroundColor = "rgb(0, 123, 255)"
                btnHide.innerText = "Bật tuyển dụng"
                iconHide.innerHTML = `<i class="fa fa-window-close text-danger"></i>`
            }else{
                btnHide.style.backgroundColor = "rgb(220, 53, 69)"
                btnHide.innerText = "Tắt tuyển dụng"
                iconHide.innerHTML = `<i class="fa fa-check-square text-primary"></i>`
            }
        }
            
        if(btnShow != null){
            if(btnShow.style.backgroundColor == "rgb(0, 123, 255)"){
                btnShow.style.backgroundColor = "rgb(220, 53, 69)"
                btnShow.innerText = "Tắt tuyển dụng"
                iconShow.innerHTML = `<i class="fa fa-check-square text-primary"></i>`
            }else{
                btnShow.style.backgroundColor = "rgb(0, 123, 255)"
                btnShow.innerText = "Bật tuyển dụng"
                iconShow.innerHTML = `<i class="fa fa-window-close text-danger"></i>`
            }
        }
            
    })
}

function hiddenApply(applyId){
    if(confirm("Xác nhận xóa đơn ứng tuyển này") == true){
        fetch("/FindJobApp/api/hidden-apply", {
           method: 'post',
           body: JSON.stringify({
               "applyId": applyId
           }),
           headers: {
               "Content-Type": "application/json"
           }
       }).then(function(res){
           let a = document.getElementById(`apply-${applyId}`)
           a.innerHTML = `
                <td class="align-middle text-center text-success font-weight-bold" colspan="6">Đã xóa thành công đơn ứng tuyển này</td>
            `
   //        location.reload()
       })
   }
}

//


function getRatePoint(point){
    document.getElementById("ratePoint").innerText = point
}

function showAddRecruitment(){
    let btn = document.getElementById("btn-showAddRecruitment")
//    if(btn.style.backgroundColor == "rgb(23, 162, 184)")
//        btn.style.backgroundColor = "#007bff"
//    else
//        btn.style.backgroundColor = "rgb(23, 162, 184)"
    if(btn.style.display == "none")
        btn.style.display = "block"
    else
        btn.style.display = "none"
    
    let hidden = document.getElementById("btn-hiddenAddRecruitment")
    if(hidden.style.display == "none")
        hidden.style.display = "block"
    else
        hidden.style.display = "none"
    
    let form = document.getElementById("form-showAddRecruitment")
    if(form.style.display == "none")
        form.style.display = "block"
    else
        form.style.display = "none"
}

function showUpdateRecruitment(){
    let btn = document.getElementById("btn-showUpdateRecruitment")

    if(btn.style.display == "none")
        btn.style.display = "block"
    else
        btn.style.display = "none"
    
    let hidden = document.getElementById("btn-hiddenUpdateRecruitment")
    if(hidden.style.display == "none")
        hidden.style.display = "block"
    else
        hidden.style.display = "none"
    
    let form = document.getElementById("form-showUpdateRecruitment")
    if(form.style.display == "none")
        form.style.display = "block"
    else
        form.style.display = "none"
}

function showUpdateUser(){
    let btn = document.getElementById("btn-showUpdateUser")

    if(btn.style.display == "none")
        btn.style.display = "block"
    else
        btn.style.display = "none"
    
    let hide = document.getElementById("btn-hideUpdateUser")
    if(hide.style.display == "none")
        hide.style.display = "block"
    else
        hide.style.display = "none"
    
    let form = document.getElementById("form-showUpdateUser")
    if(form.style.display == "none")
        form.style.display = "block"
    else
        form.style.display = "none"
}
