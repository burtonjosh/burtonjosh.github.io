# This file was generated, do not modify it. # hide
function dayofyear_noleap(year, month, day)
  num = dayofyear(DateTime(year, month, day))
  if year % 4 != 0 && month >= 3
      num += 1
  end
  num
end