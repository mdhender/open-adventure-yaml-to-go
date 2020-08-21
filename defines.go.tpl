package main

const  SILENT = -1    /* no sound */

/* Symbols for cond bits */
const  COND_LIT       = 0    /* Light */
const  COND_OILY      = 1    /* If bit 2 is on: on for oil, off for water */
const  COND_FLUID     = 2    /* Liquid asset, see bit 1 */
const  COND_NOARRR    = 3    /* Pirate doesn't go here unless following */
const  COND_NOBACK    = 4    /* Cannot use "back" to move away */
const  COND_ABOVE     = 5
const  COND_DEEP      = 6    /* Deep - e.g where dwarves are active */
const  COND_FOREST    = 7    /* In the forest */
const  COND_FORCED    = 8    /* Only one way in or out of here */
/* Bits past 10 indicate areas of interest to "hint" routines */
const  COND_HBASE     = 10   /* Base for location hint bits */
const  COND_HCAVE     = 11   /* Trying to get into cave */
const  COND_HBIRD     = 12   /* Trying to catch bird */
const  COND_HSNAKE    = 13   /* Trying to deal with snake */
const  COND_HMAZE     = 14   /* Lost in maze */
const  COND_HDARK     = 15   /* Pondering dark room */
const  COND_HWITT     = 16   /* At Witt's End */
const  COND_HCLIFF    = 17   /* Cliff with urn */
const  COND_HWOODS    = 18   /* Lost in forest */
const  COND_HOGRE     = 19   /* Trying to deal with ogre */
const  COND_HJADE     = 20   /* Found all treasures except jade */

type string_group_t struct {{
  strs []string
  n int
}}

type object_t struct {{
  words string_group_t
  inventory string
  plac int
  fixd int
  is_treasure bool
  descriptions []string
  sounds []string
  texts []string
  changes []string
}}

type description_t struct {{
  small string
  big string
}}

type location_t struct {{
  description *description_t
  sound long
  loud bool
}}

type obituary_t struct {{
  query string
  yes_response string
}}

type turn_threshold_t struct {{
  threshold int
  point_loss int
  message string
}}

type class_t struct {{
  threshold int
  message string
}}

type hint_t struct {{
  number int
  turns int
  penalty int
  question string
  hint string
}}

type motion_t struct {{
  words string_group_t
}}

type action_t struct {{
  words string_group_t
  message string
  noaction bool
}}

type condtype_t = int
// enums for condtype_t
const (
  cond_goto condtype_t = iota
  cond_pct
  cond_carry
  cond_with
  cond_not
)

type desttype_t = int
// enums for desttype_t
const (
    dest_goto desttype_t = iota
    dest_special
    dest_speak
)

type travelop_t struct {{
  motion long
  condtype long
  condarg1 long
  condarg2 long
  desttype desttype_t
  destval long
  nodwarves bool
  stop bool
}}

/* Abstract out the encoding of words in the travel array.  Gives us
 * some hope of getting to a less cryptic representation than we
 * inherited from FORTRAN, someday. To understand these, read the
 * encoding description for travel.
 */
func T_TERMINATE(entry *travelop_t) bool {{
	return entry.motion == 1
}}

const  NLOCATIONS  = {num_locations}
const  NOBJECTS    = {num_objects}
const  NHINTS      = {num_hints}
const  NCLASSES    = {num_classes}
const  NDEATHS     = {num_deaths}
const  NTHRESHOLDS = {num_thresholds}
const  NMOTIONS    = {num_motions}
const  NACTIONS    = {num_actions}
const  NTRAVEL     = {num_travel}
const  NKEYS       = {num_keys}

const  BIRD_ENDSTATE = {bird_endstate}

type arbitrary_message_ref_t = int
// enums for arbitrary_message_ref_t
const (
{arbitrary_messages}
)

type location_ref_t = int
// enums for  location_ref_t
const (
{locations}
)

type object_ref_t = int
// enums for object_ref_t
const (
{objects}
)

type motion_ref_t = int
// enums for motion_ref_t
const (
{motions}
)

type action_ref_t = int
// enums for action_ref_t
const (
{actions}
)

/* State definitions */

{state_definitions}

/* end DUNGEON_H */