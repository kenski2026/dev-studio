# Gameplay Code Rules

## Data-Driven Design

- ALL gameplay values MUST come from external config/data files, NEVER hardcoded
- Use delta time for ALL time-dependent calculations (frame-rate independence)
- State machines must have explicit transition tables with documented states

## Cross-System Communication

- NO direct references to UI code — use events/signals for cross-system communication
- Game state is separate from UI state — they observe, don't control

## Quality Standards

- Write unit tests for all gameplay logic — separate logic from presentation
- Document which design doc each feature implements in code comments
- No static singletons for game state — use dependency injection

## Examples

**Correct** (data-driven):
```python
damage = config.get_value("combat", "base_damage", 10.0)
speed = stats.movement_speed * delta
```

**Incorrect** (hardcoded):
```python
damage = 25.0  # VIOLATION: hardcoded gameplay value
speed = 5.0    # VIOLATION: not from config
```

## Performance

- Object pooling for frequently spawned entities
- Spatial partitioning for collision detection
- LOD systems for complex scenes
- Frame budget awareness (target 60fps = 16.6ms per frame)