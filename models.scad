//outer dimensions of box
length = 20;
width = 5;
height = 10;

//thickness of wall of box
wall_thickness = 1;

module rounded_box(l,w,h,wt){
module outer_hull(l,w,h){
hull() {
    translate([(l/2)-w,0,0]){
        linear_extrude(h){
           circle(w, $fn = 100);
        };
    }
    translate([-((l/2)-w),0,0]){
        linear_extrude(h){
           circle(w, $fn = 100);
        };
  }
}
}

difference(){
    outer_hull(l,w,h);
    outer_hull(l-(wt*2),w-wt,h-wt);
}
}
rounded_box(length,width,height,wall_thickness);
