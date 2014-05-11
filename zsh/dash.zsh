urlenc () {
  echo -n "$@" | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'
}

# Open argument in Dash
function dash() {
  open "dash://$(urlenc $@)"
}
