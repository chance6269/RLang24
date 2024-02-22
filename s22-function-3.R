sub <- function(a, b){
  c <- a-b
  return(c)
}

sub(10,4)


#파라미터를 지정하여 호출하면 전달하는 순서를 변경할 수 있다.
sub(b=20,a=7)
