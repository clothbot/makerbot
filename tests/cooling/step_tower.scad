// Simple stepped tower test

steps=10;
step_th=1.0;
step_dl=2.0;
top_l=2.0;

for(i=[0:steps-1]) assign(dl=i*step_dl+top_l,dh=(steps-i)*step_th) {
 echo(str("step: ",i," dl=",dl," dh=",dh));
 translate([-dl/2,-dl/2,0]) cube([dl,dl,dh],center=false);
}

