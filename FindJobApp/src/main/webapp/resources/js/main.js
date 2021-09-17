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
        console.info(res);
        return res.json();
    }).then (function(data){
        console.info(data);
        
        let area =  document.getElementById("commentArea");
        console.log(area);
        area.innerHTML = area.innerHTML + `
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
                </div>
            </div>

        </div>
        `
    }).then (function(empty){
        document.getElementById("commentId").value = "";
    })
}
