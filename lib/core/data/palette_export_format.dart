enum PaletteExportFormat {
  ase,
  aco,
  act,
  gpl,
  sketchpalette,
  soc,
  xml;

  String get extension => switch (this) {
    ase => '.ase',
    aco => '.aco',
    act => '.act',
    gpl => '.gpl',
    sketchpalette => '.sketchpalette',
    soc => '.soc',
    xml => '.xml',
  };

  String get label => switch (this) {
    ase => 'Adobe Swatch Exchange',
    aco => 'Adobe Color Swatch',
    act => 'Adobe Color Table',
    gpl => 'GIMP Palette',
    sketchpalette => 'Sketch Palette',
    soc => 'LibreOffice Colors',
    xml => 'Scribus Swatch',
  };
}