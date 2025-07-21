import copy
import opsc
import oobb
import oobb_base
import yaml
import os

def main(**kwargs):
    make_scad(**kwargs)

diameter_cap_small = 10
diameter_cap_large = 12.5
depth_cap = 3


def make_scad(**kwargs):
    parts = []

    typ = kwargs.get("typ", "")

    if typ == "":
        #setup    
        #typ = "all"
        typ = "fast"
        #typ = "manual"

    oomp_mode = "project"
    #oomp_mode = "oobb"

    if typ == "all":
        filter = ""; save_type = "all"; navigation = True; overwrite = True; modes = ["3dpr"]; oomp_run = True
        #filter = ""; save_type = "all"; navigation = True; overwrite = True; modes = ["3dpr", "laser", "true"]
    elif typ == "fast":
        #navigation true
        filter = ""; save_type = "none"; navigation = True; overwrite = True; modes = ["3dpr"]; oomp_run = False
        #filter = ""; save_type = "none"; navigation = False; overwrite = True; modes = ["3dpr"]; oomp_run = False
    elif typ == "manual":
    #filter
        filter = ""
        #filter = "test"

    #save_type
        save_type = "none"
        #save_type = "all"
        
    #navigation        
        #navigation = False
        navigation = True    

    #overwrite
        overwrite = True
                
    #modes
        #modes = ["3dpr", "laser", "true"]
        modes = ["3dpr"]
        #modes = ["laser"]    

    #oomp_run
        oomp_run = True
        #oomp_run = False  

    #adding to kwargs
    kwargs["filter"] = filter
    kwargs["save_type"] = save_type
    kwargs["navigation"] = navigation
    kwargs["overwrite"] = overwrite
    kwargs["modes"] = modes
    kwargs["oomp_mode"] = oomp_mode
    kwargs["oomp_run"] = oomp_run 

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

        directory_name = os.path.dirname(__file__) 
        directory_name = directory_name.replace("/", "\\")
        project_name = directory_name.split("\\")[-1]
        #max 60 characters
        length_max = 40
        if len(project_name) > length_max:
            project_name = project_name[:length_max]
            #if ends with a _ remove it 
            if project_name[-1] == "_":
                project_name = project_name[:-1]
                
        #defaults
        kwargs["size"] = "oobb"
        kwargs["width"] = 1
        kwargs["height"] = 1
        kwargs["thickness"] = 3
        #oomp_bits
        if oomp_mode == "project":
            kwargs["oomp_classification"] = "project"
            kwargs["oomp_type"] = "github"
            kwargs["oomp_size"] = "oomlout"
            kwargs["oomp_color"] = project_name
            kwargs["oomp_description_main"] = ""
            kwargs["oomp_description_extra"] = ""
            kwargs["oomp_manufacturer"] = ""
            kwargs["oomp_part_number"] = ""
        elif oomp_mode == "oobb":
            kwargs["oomp_classification"] = "oobb"
            kwargs["oomp_type"] = "part"
            kwargs["oomp_size"] = ""
            kwargs["oomp_color"] = ""
            kwargs["oomp_description_main"] = ""
            kwargs["oomp_description_extra"] = ""
            kwargs["oomp_manufacturer"] = ""
            kwargs["oomp_part_number"] = ""

        part_default = {} 
       
        part_default["project_name"] = project_name
        part_default["full_shift"] = [0, 0, 0]
        part_default["full_rotations"] = [0, 0, 0]
        
        diams = ["14","20","25","30","45","60"]
        #cap
        decorations = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","1","2","3","4","5","6","7","8","9","0"]
        decorations.append("")
        decorations.append("heart")
        decorations.append("flower")
        #bike
        decorations.append("bike")
        #smiley
        decorations.append("smiley")




        #cap

        sizes = ["small", "large", "over"]
        for size in sizes:
            for decoration in decorations:
                for diam in diams:
                    part = copy.deepcopy(part_default)
                    p3 = copy.deepcopy(kwargs)
                    p3["thickness"] = 3
                    p3["size_name"] = size
                    p3["decoration"] = decoration
                
                    p3["extra"] = f"{size}_size"
                    id = 0
                    if size == "over":
                        id = diam
                        p3["id"] = id
                        p3["diameter"] = diam
                        p3["extra"] = f"{p3['extra']}_{diam}_diameter"
                    if decoration != "":
                        p3["extra"] = f"{p3['extra']}_{decoration}_decoration"
                    if id == 14:
                        p3["extra"] = f"{p3['extra']}_id_{id}_mm"
                    part["kwargs"] = p3
                    part["name"] = "cap"
                    parts.append(part)

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
        
        #diams = ["14","20","25","30","45","60"]    #defined earlier now
        tos = ["m6_bolt", "flat"] 
        finishes = ["","capped"]

        thicknesses = [3,6,9,12,15,18,21,24,27,30]

        for size in sizes:
            for diam in diams:
                for to in tos:
                    for finish in finishes:
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
                        if finish != "":
                            p3["extra"] = f"{p3['extra']}_{finish}_finish"
                            p3["finish"] = finish
                        p3["screw_size"] = size
                        p3["diameter"] = diam
                        p3["to"] = to
                        part["kwargs"] = p3
                        part["name"] = "adapter"
                        parts.append(part)
   
                        for thick in thicknesses:
                            part = copy.deepcopy(part)
                            p3 = copy.deepcopy(p3)
                            p3["thickness"] = thick
                            part["kwargs"] = p3
                            parts.append(part)


       



    #make the parts
    if True:
        for part in parts:
            name = part.get("name", "default")
            extra = part.get("kwargs", {}).get("extra", "")
            if filter in name or filter in extra:
                print(f"making {part['name']}")
                make_scad_generic(part)            
                print(f"done {part['name']}")
            else:
                print(f"skipping {part['name']}")

    if navigation:
        sort = []
        sort.append("name")
        sort.append("screw_size")
        sort.append("diameter")  
        sort.append("thickness")
        sort.append("to")
        sort.append("finish")  
        sort.append("size_name")
        sort.append("decoration")

              
        
        #sort.append("flange_extra")
        #sort.append("flange_depth")
        #sort.append("thickness")
        #sort.append("screw_diameter")   
        



        generate_navigation(sort=sort)


def get_base(thing, **kwargs):

    extra = kwargs.get("extra", "")
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

    finish = kwargs.get("finish", "")
    
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
    if finish == "capped":
        pass
        d = d + depth_cap
    p3["depth"] = d
    p3["radius"] = float(diam) / 2
    #p3["m"] = "#"
    pos1 = copy.deepcopy(pos) 
    if finish == "capped":
        pos1[2] += depth_cap
    p3["pos"] = pos1
    p3["zz"] = "top"
    oobb_base.append_full(thing,**p3)
    
    #add cutout for cap
    if finish == "capped":
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "n"
        p3["shape"] = f"oobb_cylinder"
        p3["depth"] = depth_cap
        if "m5" in rad_name or "m6" in rad_name:
            p3["radius"] = diameter_cap_large/2
        else:
            p3["radius"] = diameter_cap_small/2
        p3["m"] = "#"
        pos1 = copy.deepcopy(pos) 
        pos1[2] += depth_cap/2
        p3["pos"] = pos1
        oobb_base.append_full(thing,**p3)

    #add cylinder sheath
    if "to_m6_bolt" in extra:
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "p"
        p3["shape"] = f"oobb_cylinder"
        dep = depth + 3
        p3["depth"] = dep
        p3["radius"] = 5.75/2
        p3["m"] = "#"
        pos1 = copy.deepcopy(pos)
        pos1[2] += -dep/2
        p3["pos"] = pos1

        #p3["zz"] = "top"
        oobb_base.append_full(thing,**p3)

    #add holes
    if not nut:
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "n"
        p3["shape"] = f"oobb_screw_countersunk"
        p3["radius_name"] = rad_name
        p3["depth"] = depth + 3
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

def get_cap(thing, **kwargs):
    pos = kwargs.get("pos", [0, 0, 0])
    depth = kwargs.get("thickness", 4)
    prepare_print = kwargs.get("prepare_print", False)
    extra = kwargs.get("extra", "")
    decoration = kwargs.get("decoration", "")

    if "over" in extra:
        get_cap_outside(thing, **kwargs)
    else:
        get_cap_inside(thing, **kwargs)
    
def get_cap_outside(thing, **kwargs):     
    pos = kwargs.get("pos", [0, 0, 0])
    depth = kwargs.get("thickness", 4)
    prepare_print = kwargs.get("prepare_print", False)
    extra = kwargs.get("extra", "")
    decoration = kwargs.get("decoration", "")
    id = float(kwargs.get("id", 0))

    diam = extra.split("_mm_diameter")[0]
    
    depth_top = 2
    radius_extra = 2/1

    clear = 0.075
    #clear = 1
    #add cylinder main
    p3 = copy.deepcopy(kwargs)
    p3["type"] = "p"
    p3["shape"] = f"oobb_cylinder"    
    d = depth_cap + depth_top
    p3["depth"] = d
    rad = id/2 + radius_extra
    
    p3["radius"] = rad
    #p3["m"] = "#"
    pos1 = copy.deepcopy(pos)             
    p3["pos"] = pos1
    p3["zz"] = "top"
    oobb_base.append_full(thing,**p3)
    
    #add internal cylinder cutout
    
    p3 = copy.deepcopy(kwargs)
    p3["type"] = "negative"
    p3["shape"] = f"oobb_cylinder"    
    d = depth_cap
    p3["depth"] = d
    rad = id/2
    
    p3["r1"] = rad + clear    
    p3["r2"] = rad - clear
    p3["m"] = "#"
    pos1 = copy.deepcopy(pos)             
    p3["pos"] = pos1
    pos1[2] += -depth_top #+ 30
    p3["zz"] = "top"
    oobb_base.append_full(thing,**p3)


    #add decoration
    if decoration != "":
        text = ""    
        font = "Webdings"
        size = 30
        dep = 2
        text = ""
        pos1 = copy.deepcopy(pos)
        if "heart" in decoration:
            text = "Y"
            size = 11
            font = "Webdings"
            pos1[1] += -0.5
        elif "flower" in decoration:
            text = "|"
            size = 11
            font = "Wingdings"
            pos1[1] += 0
        elif "bike" in decoration:
            text = "b"
            size = 11
            font = "Webdings"
            pos1[1] += 0
        elif "smiley" in decoration:
            text = "J"
            size = 11
            font = "Wingdings"
            pos1[1] += 0
        elif len(decoration) == 1:
            text = decoration.upper()
            size = 10
            font = "Impact"
            pos1[1] += 0

            
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "negative"
        p3["shape"] = f"oobb_text"
        p3["text"] = text
        dep = 1
        p3["depth"] = dep
        p3["size"] = size
        p3["font"] = font
        pos1[2] += -dep
        p3["pos"] = pos1
        oobb_base.append_full(thing,**p3)


    
def get_cap_inside(thing, **kwargs): 
    pos = kwargs.get("pos", [0, 0, 0])
    depth = kwargs.get("thickness", 4)
    prepare_print = kwargs.get("prepare_print", False)
    extra = kwargs.get("extra", "")
    decoration = kwargs.get("decoration", "")


    diam = extra.split("_mm_diameter")[0]
    
    
    clear = 0.075
    #add cylinder top
    p3 = copy.deepcopy(kwargs)
    p3["type"] = "p"
    p3["shape"] = f"oobb_cylinder"    
    d = depth_cap    
    p3["depth"] = d
    rad = 10
    if "small" in extra:
        rad = diameter_cap_small / 2
    elif "large" in extra:
        rad = diameter_cap_large / 2
    p3["r2"] = rad + clear    
    p3["r1"] = rad - clear
    #p3["m"] = "#"
    pos1 = copy.deepcopy(pos)             
    p3["pos"] = pos1
    p3["zz"] = "top"
    oobb_base.append_full(thing,**p3)
    
    #add decoration
    if decoration != "":
        text = ""    
        font = "Webdings"
        size = 15
        dep = 2
        text = ""
        pos1 = copy.deepcopy(pos)
        if "heart" in decoration:
            text = "Y"
            size = 16
            font = "Webdings"
            pos1[1] += -0.5
        elif "flower" in decoration:
            text = "|"
            size = 15
            font = "Wingdings"
            pos1[1] += 0
        elif "bike" in decoration:
            text = "b"
            size = 15
            font = "Webdings"
            pos1[1] += 0
        elif "smiley" in decoration:
            text = "J"
            size = 9
            font = "Wingdings"
            pos1[1] += 0
        elif len(decoration) == 1:
            text = decoration.upper()
            size = 12
            font = "Impact"
            pos1[1] += 0

            
        p3 = copy.deepcopy(kwargs)
        p3["type"] = "p"
        p3["shape"] = f"oobb_text"
        p3["text"] = text
        p3["depth"] = dep
        p3["size"] = size
        p3["font"] = font
        pos1[2] += 0
        p3["pos"] = pos1
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
    


    folder = f"scad_output/{thing['id']}"

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
        opsc.opsc_make_object(f'{folder}/{mode}.scad', thing["components"], mode=mode, save_type=save_type, overwrite=overwrite, layers=layers, tilediff=tilediff, start=start)  

    yaml_file = f"{folder}/working.yaml"
    with open(yaml_file, 'w') as file:
        yaml.dump(part, file)

def generate_navigation(folder="scad_output", sort=["width", "height", "thickness"]):
    #crawl though all directories in scad_output and load all the working.yaml files
    parts = {}
    print(f"Generating navigation for folder: {folder}")
    for root, dirs, files in os.walk(folder):
        if 'working.yaml' in files:
            yaml_file = os.path.join(root, 'working.yaml')
            with open(yaml_file, 'r') as file:
                part = yaml.safe_load(file)
                # Process the loaded YAML content as needed
                part["folder"] = root
                part_name = root.replace(f"{folder}","")
                
                #remove all slashes
                part_name = part_name.replace("/","").replace("\\","")
                parts[part_name] = part

                print(f".", end='', flush=True)

    pass
    for part_id in parts:
        if part_id != "":
            part = parts[part_id]
            kwarg_copy = copy.deepcopy(part["kwargs"])
            folder_navigation = "navigation_oobb"
            folder_source = part["folder"]
            folder_extra = ""
            for s in sort:
                if s == "name":
                    ex = part.get("name", "default")
                else:
                    ex = kwarg_copy.get(s, "default")
                folder_extra += f"{s}_{ex}/"
            #replace "." with d
            folder_extra = folder_extra.replace(".","d")
            folder_destination = f"{folder_navigation}/{folder_extra}"
            if not os.path.exists(folder_destination):
                os.makedirs(folder_destination)
            if os.name == 'nt':
                #copy a full directory
                command = f'xcopy "{folder_source}" "{folder_destination}" /E /I /Y'
                print(command)
                os.system(command)
            else:
                os.system(f"cp {folder_source} {folder_destination}")

    


if __name__ == '__main__':
    kwargs = {}
    main(**kwargs)