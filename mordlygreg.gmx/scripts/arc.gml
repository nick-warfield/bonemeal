///arc(start, peak, end, position, bias)
var p = clamp(argument[3],0,1);
if(argument[3]<=.5)
    return(lerp(argument[0],argument[1],bias(argument[4],p*2)));
else
{
    var b=1-argument[4];
    p=2*p-1
    return(lerp(argument[1],argument[2],bias(b,p)));
}
