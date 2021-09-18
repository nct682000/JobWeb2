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
        
        let area =  document.getElementById("commentArea")
        
        moment.locale('vi')
        area.innerHTML = `
        <div class="mt-2 row">
            <div class="col-md-2 text-center">
                <img alt="Avatar" src="${data.commenterId}" class="img-fluid rounded"/>
            </div>
            <div class="col-md ml-2">
                <div class="card">
                    
                    <div class="ml-3">${data.content}</div>
                </div>
                <div>
                    <span><a href="#">Thích</a> . </span>
                    <span><a href="#">Trả lời</a> . </span>
                    <span class="text-secondary my-date">Lúc: ${moment(data.createdDate).fromNow()}</span>
                    <span class="btn btn-danger">Xóa</span>
                </div>
            </div>

        </div>
        ` + area.innerHTML
    }).then (function(empty){
        document.getElementById("commentId").value = ""
        location.reload()
    })
}

function deleteComment(userId, commentId){
    fetch("/FindJobApp/api/delete-comment", {
        method: 'post',
        body: JSON.stringify({
            "userId": userId,
            "commentId": commentId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then (function(data){
        console.info(data)
        
        location.reload()
    })
}