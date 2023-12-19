// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

const canvas3 = document.getElementById('canvas3');
const ctx3 = canvas3.getContext('2d');
let x3 = 0;
function draw3() {
    ctx3.clearRect(0, 0, canvas3.width, canvas3.height);
    ctx3.fillRect(x3++, 50, 100, 100);

    // 長方形がCanvasの右端に達したら、位置をリセット
    if (x3 > canvas3.width) {
        x3 = -100; // 長方形の幅を考慮してリセット
    }
    
    window.requestAnimationFrame(draw3);
}
draw3();