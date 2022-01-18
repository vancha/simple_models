//outer dimensions of box
length = 20;
width = 5;
height = 10;
//corner_radius = 

//thickness of wall of box
wall_thickness = 1;

module rounded_box(l,w,h,wt){
    module outer_hull(l,w,h){
        hull() {
            translate([(l/2)-w,0,0]){
                linear_extrude(h){
                   circle(w, $fn = 200);
                };
            }
            translate([-((l/2)-w),0,0]){
                linear_extrude(h){
                   circle(w, $fn = 200);
                };
          }
        }
    }

    difference(){
        outer_hull(l,w,h);
        translate([0,0,wt]){
            outer_hull(l-(wt*2),w-wt,h);
        }
    }
}


//rounded_box(length,width,height,wall_thickness);
//rounded_box(5,5,2,5);
