# langevin thermostat (w/o abp), atom_style dipole, damp=100
atom_modify map array

dimension 2

units lj
atom_style dipole
boundary p p p
pair_style mie/cut 1

read_data init_config198.txt

#  dump initial config
reset_timestep 0

pair_coeff 1 1 1. 0.9785720621 64. 32.

neighbor 0.2 bin
neigh_modify every 1 delay 0 check yes

timestep 0.005

fix 1 all langevin 0.05 0.05 100 12581
fix 2 all nve
fix 3 all enforce2d

variable f file /home2/aandr/print.steps
variable s equal next(f)


dump pos1 all custom 100 /home2/aandr/mips/position/*.txt x y
dump_modify pos1 every v_s first yes
dump_modify pos1 sort id


run 100000 upto

unfix 1
