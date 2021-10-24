/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function  generateColor(){
    let r = parseInt(Math.random()*255)
    let g = parseInt(Math.random()*255)
    let b = parseInt(Math.random()*255)
    return `rgb(${r}, ${g}, ${b})`
}

function recruitmentChart(id, recruitmentLabels=[], recruitmentInfo=[]){
    let colors = []
    for(let i = 0; i < recruitmentInfo.length; i++)
        colors.push(generateColor())
    
    const data = {
        labels: recruitmentLabels,
        datasets: [{
                label: 'THỐNG KÊ SỐ LƯỢNG ỨNG TUYỂN',
                data: recruitmentInfo,
                backgroundColor: colors,
                hoverOffset: 4
        }]
    }
    
    const config = {
        type: 'bar',
        data: data
    }
    
    let ctx = document.getElementById(id).getContext("2d")
    console.log(data);
    
    new Chart(ctx, config)
}
