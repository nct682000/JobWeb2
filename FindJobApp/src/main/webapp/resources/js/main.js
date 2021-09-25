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
    }).then (function(res){
        console.info(res)
        return res.json()
    }).then (function(data){
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

 function getRatePoint(point){
        document.getElementById("ratePoint").innerText = point
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