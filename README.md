# Shade Craft

An app that takes in input of a 3D or 2D image and uses ai to give you a color palette of 7 colors that will aid you to harmonized the color blend for your creations. It will give you explanation of why the colors work together and an export feature to use those color blend in other applications(Blender, Photoshop, etc).

## App Code Design

- It's uses on device AI (Gemini Nano) first then fallback to Cloud AI(Firebase AI - Gemini 3.1 Flash) if unsupported
- A Pragmatic approach using Model View Intent (MVI) Design Pattern with Clean Architecture.
- A file picker package and a color palette format package is used to generate a palette file.


## Work in Progress
- [X] project planning and initial design.
- [X] integrate Gemini Nano and Gemini Cloud.
- [ ] test export function.
- [ ] add loading indicator and show Gemini Nano support
- [ ] polish UI
