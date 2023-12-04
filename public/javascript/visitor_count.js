// Function to update and display the visitor count
function updateVisitorCount() {
    // Check if 'visitorCount' exists in localStorage
    if (localStorage.getItem('visitorCount') === null) {
        // If not, initialize the count to 1
        localStorage.setItem('visitorCount', 1);
    } else {
        // If yes, increment the count
        let count = parseInt(localStorage.getItem('visitorCount'), 10);
        count++;
        localStorage.setItem('visitorCount', count);
    }

    // Display the count on the page
    const countElement = document.getElementById('visitorCount');
    countElement.textContent = `You are visitor #${localStorage.getItem('visitorCount')}`;
}

// Call the function when the page loads
window.onload = updateVisitorCount;