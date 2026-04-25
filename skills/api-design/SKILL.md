---
name: api-design
description: Design stable, minimal, unsurprising APIs. Use when creating new interfaces, extending existing ones, or deciding what to expose — to reduce coupling, avoid breaking callers, and keep contracts clear.
license: MIT
---

# API Design

An API is a promise. Design it to be hard to misuse, easy to understand, and cheap to keep.

**Tradeoff:** Minimal APIs constrain flexibility. That's the point — constraints prevent coupling.

## 1. Make the Pit of Success Obvious

**The right way to use the API should be the easiest way.**

- The common case should require the fewest arguments.
- Optional complexity should be opt-in, not opt-out.
- If callers consistently work around a parameter, rethink it.
- If the API requires reading docs to use correctly, the defaults are wrong.

## 2. Expose Behavior, Not Implementation

**Callers should not need to know how it works.**

- Don't leak internal types, state machines, or implementation classes in the interface.
- If changing the implementation requires changing the caller, the boundary is in the wrong place.
- Prefer passing values over passing objects with methods you'll call internally.
- Return the minimal type that conveys the result — not the richest one available.

## 3. Design for the Calling Convention, Not the Implementation

**Write the call site first. Then implement.**

- Before writing the function, write the code that would call it.
- If the call site looks awkward, redesign the function.
- If callers always pair two calls together, merge them.
- If callers always have to check a return value before using it, encode that in the type.

## 4. Additions Are Safe. Changes Are Not.

**Extend, don't mutate.**

- Adding a new optional parameter is usually safe. Changing the meaning of an existing one is never safe.
- Deprecate before removing. Give callers a path.
- If you must break an interface, do it in one place (a version bump, a rename) — not gradually across multiple changes.
- Internal code is not "safe to break freely" — future maintainers are also callers.
