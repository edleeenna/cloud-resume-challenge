// Function to update and display the visitor count
async function updateVisitorCount() {
    // fetch the API Gateway url
    let response = await fetch("https://gi4nfyz0fa.execute-api.us-east-1.amazonaws.com/visitorCount");
    let data = await response.json();
    console.log(data);
    // Display the count on the page
    const countElement = document.getElementById('visitorCount');
    countElement.textContent = `You are visitor #${data}`;
}

// Call the function when the page loads
window.onload = updateVisitorCount;