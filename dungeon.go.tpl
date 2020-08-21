package main

func generate_arbitrary_messages() []string {{
    return []string {{
{arbitrary_messages}
    }}
}}

func generate_classes() []*class_t {{
    return []*class_t{{
{classes}
    }}
}}

func generate_turn_thresholds() []*turn_threshold_t {{
    return []*turn_threshold_t{{
{turn_thresholds}
    }}
}}

func generate_locations() []*location_t {{
    return []*location_t{{
{locations}
    }}
}}

func generate_objects() []*object_t {{
    return []*object_t{{
{objects}
    }}
}}

func generate_obituaries() []*obituary_t {{
    return []*obituary_t{{
{obituaries}
    }}
}}

func generate_hints() []*hint_t {{
    return []*hint_t{{
{hints}
    }}
}}

func generate_conditions() []long {{
    return []long{{
{conditions}
    }}
}}

func generate_motions() []*motion_t {{
    return []*motion_t{{
{motions}
    }}
}}

func generate_actions() []*action_t {{
    return []*action_t{{
{actions}
    }}
}}

func generate_tkey() []long {{
    return []long{{{tkeys}
    }}
}}

func generate_travel() []*travelop_t {{
    return []*travelop_t{{
{travel}
    }}
}}

var ignore = "{ignore}"

/* end */