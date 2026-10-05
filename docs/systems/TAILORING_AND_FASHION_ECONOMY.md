# 🧵 Parametric 3D Tailoring, Fashion Economy & Creator Provenance

> **Document Type:** Core System Architecture & Gameplay Specification  
> **Status:** APPROVED (Decision [D-006](file:///d:/GAME%20LIVRO/WORLD_PROJECT_GITHUB/DECISIONS.md#d-006))  
> **Scope:** In-game Crafting, Non-Combat Professions, 3D Asset Pipeline, In-Game Economy, Social Status & Education.

---

## 1. Executive Vision

In the *Unnamed World Project*, clothing is not merely an inventory icon or a fixed cosmetic drop from a loot box. It is an **active, player-driven craft, economy, and social language**.

Players who choose not to focus on hunting, combat, or heavy construction can build world-renowned reputations as **Digital Tailors, Weavers, and Fashion Designers**. Through an accessible, modular in-game 3D editor, players design authentic, realistic garments that are physically generated on the character's body, stamped with permanent creator provenance, and traded across regional clan markets.

---

## 2. In-Game Parametric Clothing Editor (Creator Mode)

To allow any player to create without requiring external tools (such as Blender) or 3D modeling expertise, the game implements an in-engine **Parametric Garment Generator**:

```
Select Base Piece Type
         ↓
Adjust Parametric Sliders (Length, Fit, Cut)
         ↓
Select Material & Weave (Wool, Linen, Tanned Leather)
         ↓
Configure Components (Sleeves, Collars, Hoods, Cuffs, Belts)
         ↓
Add Surface Details (Stitching, Pockets, Wear, Fasteners)
         ↓
Real-Time Dynamic Character Preview (Locomotion & Wind)
         ↓
Automated Mesh Optimization, Rig & Collision Fitting
         ↓
Publish with Permanent Provenance to Clan / World Market
```

### Parametric Controls Available to Players:
* **Geometry & Fit:** Garment length, body taper, sleeve length/cut, collar height, hood drape, hemline cut, belt tightness, layering depth.
* **Materials & Textures:** Raw wool, fine spun linen, oiled leather, cured hide, quilted gambeson, canvas.
* **Surface Craft:** Stitch density, thread dye, hem wear/fraying, functional pockets, bone/horn buttons, metallic buckles.
* **Underlying Engine Tech:** Built upon pre-rigged base meshes, dynamic blend shapes, bone deformers, and vertex weight transfer tied directly to Godot 4 skeleton rigs to ensure zero mesh clipping during running, swimming, and river crossings.

---

## 3. Two-Tier Creation Architecture

To protect server performance, prevent asset bloat, and guarantee pure anatomical realism, the system operates across two distinct tiers:

### Tier 1: In-Game Creator Mode (For All Players)
* Safe, parameter-constrained modular generation.
* Uses pre-optimized, engine-verified modules.
* Guaranteed zero clipping, pre-calculated LODs, and instant validation.

### Tier 2: Professional External Pipeline (For 3D Artists)
* Advanced artists can import custom garments modeled externally (Blender, Marvelous Designer, Character Creator).
* Every asset must pass an **Automated Headless Ingestion Gate** before approval:
  1. **Polycount Cap:** Strict triangle budgets per LOD tier (LOD0: max 12k tris, LOD1: 5k, LOD2: 1.5k).
  2. **Texture Limits:** Maximum 2K PBR texture sets (Albedo, Roughness/Metallic, Normal, Ambient Occlusion).
  3. **Skeleton & Rig Conformance:** Must strictly conform to the official Godot human humanoid bone hierarchy.
  4. **Collision & Clipping Verification:** Automated simulation of extreme poses (sprinting, crouching, swimming) to ensure zero body penetration.
  5. **Art Direction & Content Screening:** Verification against the realism guidelines (no neon colors, no modern sportswear, no fantasy magic runes, no copyrighted trademarks).

---

## 4. Immutable Provenance & Garment Identity

Every garment created in the world is stamped with permanent, immutable metadata. When any player inspects an outfit, its authentic lineage is revealed:

```yaml
Item: "North Ridge Expedition Parka No. 17"
Creator: "Ana_River"
Creation_Era: "Year 3 (Winter)"
Origin_Server: "North Valley Hearth"
Material_Composition: "Double-woven Wool & Waxed Cowhide"
Copies_Circulating: 1,284
Lineage: "Expedition Series • First River Crossing Commemorative"
Version: "v1.2 (Reinforced Hem)"
```

### Historic & Legacy Memorabilia
* A coat worn by the leader of an epic first-time mountain expedition can become legendary.
* Generations later, that original piece (or authenticated replicas) holds historic cultural prestige, auction value, and museum display status within regional settlements.

---

## 5. Non-Pay-to-Win: Appearance vs. Mechanical Function

To protect the pure survival integrity of the world:

> **Core Rule:** *Cosmetics define identity and cultural prestige, never arbitrary combat power.*

* **Zero Hidden Combat Buffs:** A tailored jacket sold in the marketplace cannot grant `+20% speed` or `+30 damage`.
* **Balanced Thermoregulation:** Environmental protection (temperature insulation, rain resistance, weight burden, windchill resistance) is governed strictly by the **physical materials used** (e.g., thick wool naturally insulates; heavy wet leather increases encumbrance during river crossings), which must be harvested or bought within the authentic survival ecosystem.

---

## 6. AI as a Guided Design Assistant

Natural language AI acts as an in-game **Master Tailor Consultant**, not an unchecked generator:

* **Player Prompt:** *"I need a heavy, weatherproof hunting coat for cold damp mountain rains, rugged and unadorned."*
* **AI Consultant Action:** 
  1. Analyzes the biome conditions (temperature, moisture, brush density).
  2. Recommends optimal parametric combinations: long wax-coated linen exterior, sheared sheepskin collar, reinforced shoulder straps for bow carriage.
  3. Pre-sets the in-game editor sliders to that aesthetic baseline.
* The player retains complete manual control to tweak, tailor, color, and personalize before crafting.

---

## 7. The Fashion Economy & Non-Combat Career Pathways

This system introduces a complete, self-sustaining civilian and artisan economy:

### Emergent Roles:
* **Digital Tailor / Stylist:** Designs unique pieces and seasonal collections.
* **Tanner & Weaver:** Focuses on harvesting and refining ultra-pure raw fabrics and leathers.
* **Clan Armorer / Uniform Designer:** Contracted by major clans to design distinct heraldic uniforms and expedition attire.
* **Catalog Merchant & Shopkeeper:** Owns physical trading posts in major settlements to sell branded clothing lines.

### Creator Metrics & In-Game Fame:
Tailors gain public reputation scores based on authentic world engagement:
* Total sales and circulating garments;
* Number of clans wearing their collections;
* Historical event commissions;
* In-game creator rating (`4.9 / 5.0`).

---

## 8. Educational & Career Bridge

This system directly realizes the mission defined in [LEARNING_AND_EDUCATION.md](../../LEARNING_AND_EDUCATION.md):
* Students of **Fashion Design, 3D Textile Modeling, and Digital Art** gain practical experience designing within real game engine constraints.
* Contributors build a **verifiable, public portfolio** of 3D garments with documented circulation metrics, serving as proof of production competency for real-world creative industries.
