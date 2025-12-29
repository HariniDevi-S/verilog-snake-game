#  Verilog Snake Game Controller

Hardware implementation of the classic Snake game using Verilog HDL.

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-FPGA-orange)

##  Project Overview

Built as part of my VLSI learning journey to understand hardware design principles through a practical, interactive project. This is the **hardware logic** that would run on an FPGA to control a Snake game.

##  Architecture

### Core Modules

**1. `game_controller.v`** - FSM managing game states
- States: IDLE → PLAYING → GAME_OVER
- Handles timing, collisions, and scoring
- Configurable movement speed

**2. `snake_body.v`** - Position tracking and movement
- Tracks head and body segment positions
- Implements directional movement logic
- Handles snake growth when eating food

**3. `collision_detector.v`** - Real-time collision detection
- Wall collision detection
- Self-collision detection
- Operates in a single clock cycle

**4. `lfsr_random.v`** - Random food placement
- LFSR-based pseudo-random number generator
- Generates X, Y coordinates for food placement
- 8-bit LFSR with polynomial taps

**5. `snake_game_top.v`** - Top-level integration
- Connects all modules
- Manages inter-module communication
- Single unified interface

**6. `snake_game_tb.v`** - Comprehensive testbench
- Simulates complete gameplay scenarios
- Verifies all functionality
- Captures waveforms for analysis

##  Technical Specifications

- **Language:** Verilog HDL
- **Grid Size:** 8×8
- **Clock Frequency:** 100 MHz (10ns period)
- **Snake Speed:** Configurable via MOVE_SPEED parameter
- **Simulation Tool:** EDA Playground / Icarus Verilog
- **Design Style:** Synchronous, clock-based
- **Total Lines of Code:** ~280 lines

##  Features Implemented

- Four-directional movement (UP, DOWN, LEFT, RIGHT)  
- Random food generation using LFSR  
- Collision detection (walls and self)  
- Score tracking  
- FSM-based game state management  
- Configurable movement speed  
- Complete testbench with verification  

##  Simulation & Testing

### Running the Simulation

**Using EDA Playground:**
1. Visit [EDA Playground](https://edaplayground.com/)
2. Copy `snake_game_tb.v` to testbench pane
3. Copy all design modules to design pane
4. Select "Icarus Verilog 0.9.7"
5. Click "Run"

**Using Icarus Verilog (local):**
```bash
iverilog -o snake_game *.v
vvp snake_game
gtkwave dump.vcd
```

### Simulation Results
```
- FSM state transitions: IDLE → PLAYING → GAME_OVER
- Movement in all 4 directions verified
- Collision detection working correctly
- Random food generation functional
- Score increment on food consumption
- All timing requirements met
```

**Console Output Example:**
```
Time=55000  | State=01 (PLAYING) | Score=0 | Head=(4,4) | Food=(2,5)
Time=10075000 | State=01 | Head=(4,5) | Food=(5,2)
Final Score: 0
Game State: 1 (PLAYING)
- Simulation completed successfully
```

##  What This Project Demonstrates

### Hardware Design Skills:
- **Finite State Machines (FSM):** Game controller with state management
- **Sequential Logic:** Clock-based synchronous design
- **Combinational Logic:** Collision detection in single cycle
- **Random Number Generation:** LFSR implementation
- **Modular Design:** Clean module separation and integration
- **Timing Control:** Movement speed management via counters

### Verification Skills:
- **Testbench Development:** Comprehensive test scenarios
- **Waveform Analysis:** Signal verification via EPWave
- **Functional Verification:** Complete gameplay simulation
- **Debug Methodology:** Systematic testing approach

##  Key Learnings

Through this project, I gained hands-on experience with:

**1. FSM Design**
- State machine implementation for game control
- Proper state transition handling
- Edge case management

**2. Blocking vs Non-blocking Assignments**
- Understanding when to use `=` vs `<=`
- Sequential vs combinational logic
- Avoiding race conditions

**3. LFSR Implementation**
- Pseudo-random number generation in hardware
- Polynomial tap configuration
- Seed value selection

**4. Clock-based Timing**
- Synchronous design principles
- Counter-based event triggering
- Movement speed control

**5. Testbench Development**
- Stimulus generation
- Result monitoring
- Waveform capture and analysis

**6. Modular Design**
- Breaking complex systems into manageable modules
- Clear interface definitions
- Hierarchical design approach

### Biggest Challenge

**Implementing snake "growth" in hardware without dynamic memory allocation.**

**Solution:** Used shift registers and enable signals for body segment tracking. When the snake eats food, the `grow` signal prevents the tail from moving forward, effectively adding a new segment.

##  Background

Completed as part of my VLSI learning journey:

**Courses:**
- **Verilog HDL: VLSI Hardware Design Comprehensive Masterclass** (Udemy)  
  Instructor: Shepherd Tutorials
  
- **Verilog HDL Fundamentals for Digital Design and Verification** (Udemy)  
  Instructor: Ovidiu Plugariu

**Duration:** 18 hours total course content + hands-on project development

##  File Structure
```
verilog-snake-game/
├── collision_detector.v    # Collision detection logic
├── game_controller.v       # FSM and game logic
├── lfsr_random.v          # Random number generator
├── snake_body.v           # Snake position tracking
├── snake_game_tb.v        # Testbench
├── snake_game_top.v       # Top-level module
├── LICENSE                # MIT License
└── README.md              # This file
```

##  Connect

**LinkedIn:** www.linkedin.com/in/harinidevi66

**More VLSI projects coming soon!**

##  License

MIT License - Feel free to learn from.

See [LICENSE](LICENSE) file for full details.

##  Acknowledgments

- Course instructors: Shepherd Tutorials and Ovidiu Plugariu
- EDA Playground for providing free simulation environment
- The open-source hardware community for inspiration

---

 **If you found this project helpful or interesting, please consider starring the repository!**

**Built with curiosity and a passion for hardware design** 

---

*This project is part of my journey learning VLSI and digital design. Feedback and suggestions are always welcome!*
