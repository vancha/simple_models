//outer dimensions of box
length = 20;
width = 5;
height = 10;
//corner_radius = 

//thickness of wall of box
wall_thickness = 1;


//a rounded box, with optional lid
module rounded_box(l,w,h,wt,lid){
    //the outer shell of the box, filled in
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
    //takes the outer shell, and hollows it out
    module hollowed_outer_hull(l,w,h,wt){
        difference(){
            outer_hull(l,w,h);
            translate([0,0,wt]){
                outer_hull(l-(wt*2),w-wt,h);
            }
        }
    }
    
    module box_lid(l,w,h,wt){
        translate([0,0,height + 4]){
            hollowed_outer_hull(l,w,1,w);
            translate([0,0,-.5]){
                outer_hull(l-(wt*2),w-wt,1);
            }
            
        }
        
    }
    
    //makes sure a box is created when this module is called
    hollowed_outer_hull(l,w,h,wt);
    if(lid){
        box_lid(l,w,h,wt);
    }
}


rounded_box(length,width,height,wall_thickness,true);
