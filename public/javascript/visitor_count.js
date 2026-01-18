// Function to update and display the visitor count
async function updateVisitorCount() {
    // fetch the API Gateway url
    let response = await fetch("https://x4s25thrzikdkl2kmb2h54avti0myeag.lambda-url.us-east-1.on.aws/");
    
    // Wait for the response to be parsed as JSON
    let data = await response.json();
    
    // Display the count on the page
    const countElement = document.getElementById('visitorCount');
    countElement.textContent = `#${data}`;
    
   }

// Call the function when the page loads
window.onload = updateVisitorCount;
