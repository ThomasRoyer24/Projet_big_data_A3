#replace null places with 0
for(row in 1:73643){
  if (data[row,"place"] == "NULL") {data[row,"place"] =0}
}
