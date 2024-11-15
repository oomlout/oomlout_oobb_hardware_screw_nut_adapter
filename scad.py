import copy
import opsc
import oobb
import oobb_base

def main(**kwargs):
    make_scad(**kwargs)

def make_scad(**kwargs):
    parts = []

    # save_type variables
    if True:
        filter = ""
        #filter = "test"

        kwargs["save_type"] = "none"
        kwargs["save_type"] = "all"
        
        kwargs["overwrite"] = True
        
        #kwargs["modes"] = ["3dpr", "laser", "true"]
        kwargs["modes"] = ["3dpr"]
        #kwargs["modes"] = ["laser"]

    # default variables
    if True:
        kwargs["size"] = "oobb"
        kwargs["width"] = 1
        kwargs["height"] = 1
        kwargs["thickness"] = 9
        
    # project_variables
    if True:
        pass
    
    # declare parts
    if True:

        part_default = {} 
        part_default["project_name"] = "test" ####### neeeds setting
        part_default["full_shift"] = [0, 0, 0]
        part_default["full_rotations"] = [0, 0, 0]
        

        sizes  = []
        sizes2 = ["m5", "m4", "m3d5", "m3"]
        
        for size in sizes2:
            sizes.append(f"{size}_screw_wood")
        sizes.append("m3")
        #sizes.append("m4")
        sizes.append("m2d5")
        sizes.append("m2")
        #add nuts
        sizes2 = ["m2d5_nut", "m3_nut", "m4_nut", "m5_nut", "m6_nut"]
        for size in sizes2:
            sizes.append(f"{size}")
        
        diams = ["14","30","45","60"]
        tos = ["m6_bolt", "flat"] 

        

        for size in sizes:
            for diam in diams:
                for to in tos:
                    
                    if "_nut" not in size:
                        screw_size_depth_variable = f"screw_countersunk_height_{size}"
                        screw_size_depth = oobb_base.gv(screw_size_depth_variable,"3dpr")
                    else:                        
                        screw_size_depth_variable = f"nut_depth_{size.replace('_nut','')}"
                        screw_size_depth = oobb_base.gv(screw_size_depth_variable,"3dpr")
                    part = copy.deepcopy(part_default)
                    p3 = copy.deepcopy(kwargs)
                    p3["thickness"] = screw_size_depth
                    p3["extra"] = f"{size}_{diam}_mm_diameter_to_{to}"
                    part["kwargs"] = p3
                    part["name"] = "adapter"
                    parts.append(part)

                    part = copy.deepcopy(part)
                    p3 = copy.deepcopy(p3)
                    p3["thickness"] = 9
                    part["kwargs"] = p3
                    parts.append(part)
                
    #make the parts
    if True:
        for part in parts:
            name = part.get("name", "default")
            if filter in name:
                print(f"making {part['name']}")
                make_scad_generic(part)            
                print(f"done {part['name']}")
            else:
                print(f"skipping {part['name']}")

def get_base(thing, **kwargs):

    depth = kwargs.get("thickness", 4)
    prepare_print = kwargs.get("prepare_print", False)

    pos = kwargs.get("pos", [0, 0, 0])
    #pos = copy.deepcopy(pos)
    #pos[2] += -20

    #add plate
    p3 = copy.deepcopy(kwargs)
    p3["type"] = "p"
    p3["shape"] = f"oobb_plate"    
    p3["depth"] = depth
    #p3["m"] = "#"
    pos1 = copy.deepcopy(pos)         
    p3["pos"] = pos1
    oobb_base.append_full(thing,**p3)
    
    
    #add holes
    p3 = copy.deepcopy(kwargs)
    p3["type"] = "p"
    p3["shape"] = f"oobb_holes"
    p3["both_holes"] = True  
    p3["depth"] = depth
    p3["holes"] = "perimeter"
    #p3["m"] = "#"
    pos1 = copy.deepcopy(pos)         
    p3["pos"] = pos1
    oobb_base.append_full(thing,**p3)

    if prepare_print:
        #put into a rotation object
        components_second = copy.deepcopy(thing["components"])
        return_value_2 = {}
        return_value_2["type"]  = "rotation"
        return_value_2["typetype"]  = "p"
        pos1 = copy.deepcopy(pos)
        pos1[0] += 50
        return_value_2["pos"] = pos1
        return_value_2["rot"] = [180,0,0]
        return_value_2["objects"] = components_second
        
        thing["components"].append(return_value_2)

    
        #add slice # top
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "n"
        p3["shape"] = f"oobb_slice"
        #p3["m"] = "#"
        oobb_base.append_full(thing,**p3)
    
###### utilities

def get_adapter(thing, **kwargs):

    depth = kwargs.get("thickness", 4)
    prepare_print = kwargs.get("prepare_print", False)
    extra = kwargs.get("extra", "")


    
    diam = extra.split("_mm_diameter")[0]
    
    
    nut = False
    if "_nut" in diam:
        nut = True
    #diamaeter
    
    
    if "_screw_wood_" in diam:
        diam = diam.split("_screw_wood_")[1]
    elif "_nut" in diam:
            nut = True
            diam = diam.split("_nut_")[1]
    else:
        diam = diam.split("_")[1]

    
        


    #extra piece before "to"
    rad_name = extra.split(f"_{diam}_mm_diameter")[0]
    rad_name = rad_name.replace("_nut","")

    pos = kwargs.get("pos", [0, 0, 0])
    #pos = copy.deepcopy(pos)
    #pos[2] += -20

    #add cylinder top
    p3 = copy.deepcopy(kwargs)
    p3["type"] = "p"
    p3["shape"] = f"oobb_cylinder"    
    d = depth
    if nut:
        d = d+1.5
    p3["depth"] = d
    p3["radius"] = float(diam) / 2
    #p3["m"] = "#"
    pos1 = copy.deepcopy(pos)             
    p3["pos"] = pos1
    p3["zz"] = "top"
    oobb_base.append_full(thing,**p3)
    
    #add cylinder sheath
    if "_bolt" in extra:
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "p"
        p3["shape"] = f"oobb_cylinder"
        p3["depth"] = depth
        p3["radius"] = 5.75/2
        #p3["m"] = "#"
        pos1 = copy.deepcopy(pos)
        p3["pos"] = pos1
        p3["zz"] = "top"
        oobb_base.append_full(thing,**p3)

    #add holes
    if not nut:
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "n"
        p3["shape"] = f"oobb_screw_countersunk"
        p3["radius_name"] = rad_name
        p3["depth"] = depth
        #p3["m"] = "#"
        pos1 = copy.deepcopy(pos)         
        p3["pos"] = pos1
        oobb_base.append_full(thing,**p3)
    elif nut:
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "n"
        p3["shape"] = f"oobb_nut"        
        p3["radius_name"] = rad_name
        #p3["depth"] = depth
        #p3["m"] = "#"
        p3["zz"] = "top"
        pos1 = copy.deepcopy(pos)         
        p3["pos"] = pos1
        oobb_base.append_full(thing,**p3)
        #add hole
        p4 = copy.deepcopy(p3)
        p4["shape"] = f"oobb_hole"
        p4["m"] = "#"
        oobb_base.append_full(thing,**p4)


    if prepare_print:
        #put into a rotation object
        components_second = copy.deepcopy(thing["components"])
        return_value_2 = {}
        return_value_2["type"]  = "rotation"
        return_value_2["typetype"]  = "p"
        pos1 = copy.deepcopy(pos)
        pos1[0] += 50
        return_value_2["pos"] = pos1
        return_value_2["rot"] = [180,0,0]
        return_value_2["objects"] = components_second
        
        thing["components"].append(return_value_2)

    
        #add slice # top
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "n"
        p3["shape"] = f"oobb_slice"
        #p3["m"] = "#"
        oobb_base.append_full(thing,**p3)
    
###### utilities



def make_scad_generic(part):
    
    # fetching variables
    name = part.get("name", "default")
    project_name = part.get("project_name", "default")
    
    kwargs = part.get("kwargs", {})    
    
    modes = kwargs.get("modes", ["3dpr", "laser", "true"])
    save_type = kwargs.get("save_type", "all")
    overwrite = kwargs.get("overwrite", True)

    kwargs["type"] = f"{project_name}_{name}"

    thing = oobb_base.get_default_thing(**kwargs)
    kwargs.pop("size","")

    #get the part from the function get_{name}"
    func = globals()[f"get_{name}"]    
    # test if func exists
    if callable(func):            
        func(thing, **kwargs)        
    else:            
        get_base(thing, **kwargs)   
    

    for mode in modes:
        depth = thing.get(
            "depth_mm", thing.get("thickness_mm", 3))
        height = thing.get("height_mm", 100)
        layers = depth / 3
        tilediff = height + 10
        start = 1.5
        if layers != 1:
            start = 1.5 - (layers / 2)*3
        if "bunting" in thing:
            start = 0.5
        opsc.opsc_make_object(f'scad_output/{thing["id"]}/{mode}.scad', thing["components"], mode=mode, save_type=save_type, overwrite=overwrite, layers=layers, tilediff=tilediff, start=start)    


if __name__ == '__main__':
    kwargs = {}
    main(**kwargs)