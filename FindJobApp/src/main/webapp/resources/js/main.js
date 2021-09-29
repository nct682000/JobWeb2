/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
                    <span><a href="#">Thích</a> . </span>
                    <span><a href="#">Trả lời</a> . </span>
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
//        location.reload()
        return res.json()
    }).then(function(data){
        console.info(data)
    })
}


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