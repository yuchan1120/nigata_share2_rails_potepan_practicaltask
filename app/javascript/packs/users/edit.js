function hamburger() {
  document.getElementById('line1').classList.toggle('line_1');
  document.getElementById('nav').classList.toggle('in');
}
document.getElementById('hamburger').addEventListener('click' , function () {
  hamburger();
} );
