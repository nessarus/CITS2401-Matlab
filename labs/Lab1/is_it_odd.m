function tf = is_it_odd(n)
  if isequal(mod(n,2),0)
      tf = false;
  else
      tf = true;
  end
end