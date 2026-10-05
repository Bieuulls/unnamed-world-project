# 🌲 Unnamed World Project — Godot 4 Prototype

> **Engine:** Godot 4.3+ (Forward+ / Mobile compatible)  
> **Status:** Phase 0 / Early Alpha Prototype (`v0.1.0-alpha`)  
> **Core Pillar:** Realistic Locomotion, Stamina Management, and Indifferent Nature (River Physics).

---

## 🧭 Project Architecture

```text
game/
├── project.godot                  # Engine configuration, autoloads, input mappings
├── icon.svg                       # Project branding icon
├── scenes/
│   ├── main.tscn                  # Starting test world with terrain, lighting & river
│   ├── player/
│   │   └── player.tscn            # 3D CharacterBody3D with camera pivot & collisions
│   ├── ui/
│   │   └── hud.tscn               # Minimalist immersion HUD (crosshair + dynamic stamina)
│   └── world/                     # Environmental and terrain scenes
├── scripts/
│   ├── core/
│   │   └── game_manager.gd        # Global Autoload singleton (Pause, Game State, Telemetry)
│   ├── player/
│   │   └── player_controller.gd   # Realistic human movement, camera clamp, stamina
│   ├── ui/
│   │   └── hud.gd                 # Dynamic HUD controller
│   └── world/
│       └── river_current_area.gd  # Indifferent river physics (continuous directional drag)
├── assets/
│   ├── models/                    # 3D meshes (FBX, OBJ, glTF, .blend)
│   ├── textures/                  # Textures, normal maps, roughness maps (PNG, WebP)
│   ├── audio/                     # SFX, foley, and ambient soundscapes (WAV, OGG)
│   └── fonts/                     # Typography assets (TTF, OTF)
└── shaders/                       # Custom GLSL shaders (water, wind on foliage, atmosphere)
```

---

## 🎮 Controls

| Action | Key / Input | Behavior |
| :--- | :--- | :--- |
| **Move** | `W`, `A`, `S`, `D` | Realistic human walking speed (3.8 m/s) |
| **Look / Aim** | `Mouse` | Free 3D camera look with vertical clamp |
| **Sprint** | `Shift` (Hold) | Sprint speed (6.5 m/s) — drains stamina continuously |
| **Jump** | `Space` | Physical vertical impulse (requires stamina) |
| **Pause / Release Mouse** | `Escape` | Pauses game loop and frees cursor |
| **Debug Info** | `F3` | Toggles telemetry/debug info |

---

## 🚀 How to Run Locally

1. **Download Godot 4:**
   - Install **Godot 4.3 or newer** from [godotengine.org](https://godotengine.org/download) (or via `winget install GodotEngine.GodotEngine`).
2. **Open Project:**
   - Launch Godot.
   - Click **Import** -> Select the `game/project.godot` file in this folder.
3. **Run:**
   - Press **F5** (or click the Play button in the top-right corner) to run `res://scenes/main.tscn`.

---

## 🧪 Implemented Gameplay Mechanics

1. **Indifferent Water Physics:**
   - Walking into the riverbed activates `RiverCurrentArea`.
   - The river does not care who you are — it pushes bodies downstream with realistic continuous force.
2. **Human Weight & Stamina:**
   - Sprinting and jumping deplete stamina.
   - The HUD stamina bar automatically hides when stamina is full to maintain absolute cinematic immersion.
3. **Open-Source Contribution:**
   - Want to add trees, craft tools, or improve water shaders? Check out [CONTRIBUTING.md](../CONTRIBUTING.md) at the repository root!
