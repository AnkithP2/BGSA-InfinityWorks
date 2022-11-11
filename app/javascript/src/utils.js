// Hides a supplied div id
function hideField(divToHide) {
    var fieldToHide = document.getElementById(divToHide)
    fieldToHide.style.display = 'none'
}

// shows/unhides a supplied div id
function showField(divToShow) {
    var fieldToShow = document.getElementById(divToShow)
    fieldToShow.style.display = 'block';
}

// toggles the visability of a supplied div id
function toggleField(divToToggle) {
    var fieldToToggle = document.getElementById(divToToggle)
    fieldToToggle.style.display === 'block' ? fieldToHide.style.display = 'none' : fieldToHide.style.display = 'block';
}

// returns the visability status bool of a supplied div
function isVisable(divToCheck) {
    var div = document.getElementById(divToCheck)
    var isFound = false;

    div.style.display === 'block' ? isFound = true : isFound = false
    return isFound
}