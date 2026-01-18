mod app;

use app::RetroToyStationApp;

fn main() -> Result<(), eframe::Error> {
    let native_options = eframe::NativeOptions::default();

    eframe::run_native(
        "Retro Toy Station",
        native_options,
        Box::new(|cc| Ok(Box::new(RetroToyStationApp::new(cc)))),
    )
}
