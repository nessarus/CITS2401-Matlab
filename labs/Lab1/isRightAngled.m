function flag = isRightAngled(a, b, c)
  if isequal(c^2,a^2+b^2)
    flag = true;
  else
    flag = false;
  end
end