const imageLoader = document.getElementById('imageLoader');
const textInput = document.getElementById('textInput');
const backgroundImage = document.getElementById('background-image');
const draggableText = document.getElementById('draggable-text');
const container = document.getElementById('canvas-container');

imageLoader.addEventListener('change', function(e) {
    const reader = new FileReader();
    reader.onload = function(event) {
        backgroundImage.src = event.target.result;
    }
    reader.readAsDataURL(e.target.files[0]);
});

textInput.addEventListener('input', function(e) {
    draggableText.innerText = e.target.value || "Your Text Here";
});

let isDragging = false;
let startX, startY, initialLeft, initialTop;

draggableText.addEventListener('mousedown', function(e) {
    isDragging = true;
    startX = e.clientX;
    startY = e.clientY;
    
    // Get current position
    const rect = draggableText.getBoundingClientRect();
    const containerRect = container.getBoundingClientRect();
    
    // Calculate position relative to container
    initialLeft = draggableText.offsetLeft;
    initialTop = draggableText.offsetTop;
    
    // Remove transform centering if we start dragging
    draggableText.style.transform = 'none';
    draggableText.style.left = initialLeft + 'px';
    draggableText.style.top = initialTop + 'px';
});

document.addEventListener('mousemove', function(e) {
    if (isDragging) {
        const dx = e.clientX - startX;
        const dy = e.clientY - startY;
        
        let newLeft = initialLeft + dx;
        let newTop = initialTop + dy;
        
        // Boundary checks (optional, but good for UX)
        const containerRect = container.getBoundingClientRect();
        const textRect = draggableText.getBoundingClientRect();
        
        // Simple boundary check to keep text somewhat inside
        // You can remove this if you want total freedom
        
        draggableText.style.left = newLeft + 'px';
        draggableText.style.top = newTop + 'px';
    }
});

document.addEventListener('mouseup', function() {
    isDragging = false;
});
