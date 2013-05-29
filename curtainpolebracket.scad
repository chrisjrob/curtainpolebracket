// curtainpolebracket.scad
// Bracket for a curtain pole
// 
// Copyright (C) 2013 Christopher Roberts
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


// Global Parameters

// Bracket
height         = 5.4;   // Height of bracket
diameter       = 44.0;  // Diameter of bracket

// Cutaway for Bolt Head
bh_height      = 3.50;  // Clearance required for head of bolt
bh_diameter    = 16.75; // Diameter of bolt head hole

// Other holes (suggest increase actual size by 0.3mm)
bolt_diameter  = 6.3;   // Diameter of the bolt hole
screw_diameter = 6.0;   // Diameter of the screw holes

// Circular precision
precision      = 200;

module bracket() {

    difference() {

        // Things that exist
        union() {
            cylinder( h = height, r = diameter/2, $fn = precision );

        }

        // Things to be cut out
        union() {

            // Bolt hole head recess
            translate( v = [0, 0, bh_height] ) {
                cylinder( h = bh_height, r = bh_diameter/2, $fn = precision );
            }

            // Bolt hole
            cylinder( h = height, r = bolt_diameter/2, $fn = precision );

            // Screw holes
            translate( v = [ diameter/2 - bh_diameter/2, 0, 0]) {
                cylinder( h = height, r = screw_diameter/2, $fn = precision );
            }
            translate( v = [ -diameter/2 + bh_diameter/2, 0, 0]) {
                cylinder( h = height, r = screw_diameter/2, $fn = precision );
            }

        }
    }

}

bracket();
