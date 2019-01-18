import npyscreen


class ExampleTUI(npyscreen.NPSAppManaged):
    def onStart(self):
        self.addForm("MAIN", myTUI, name="Main TUI Form")
        self.addForm("Hal's", HalsTUI, name="What Dave thinks of you")


class myTUI(npyscreen.ActionForm):
    def activate(self):
        self.edit()
        self.parentApp.setNextForm("Hal's")

    def create(self):
        self.hello = self.add(npyscreen.TitleFixedText,
                              name="Say Hello, Hal", value="Hello, Dave")
        self.retort = self.add(npyscreen.Textfield, 
                               value="Hal, you are terrible. Read my lips: You suck!")
        self.onAscale = self.add(npyscreen.TitleSlider, out_of=10,
                                 name="On a scale of one to ten, how is Hal's performance?")

        self.favFile = self.add(npyscreen.TitleFilenameCombo,
                                name="What is your favorite file?", label=True)
        self.chooseDate = self.add(npyscreen.DateCombo, 
                                   name="When you started hating Hal", allowPastDate=True,
                                   allowTodaysDate=True, label=True)
        self.siriOrHal = self.add(npyscreen.TitleSelectOne, 
                                  values=["Siri", "Cortana", "Hal", "Tay"], name="Who do you prefer?")

    def on_ok(self):
        toHal = self.parentApp.getForm("Hal's")
        toHal.scale.value = self.onAscale.value
        toHal.d.value = self.chooseDate.value
        toHal.pre.value = self.siriOrHal.values[self.siriOrHal.value[0]]
        toHal.favfile.value = self.favFile.value
        toHal.filename = self.favFile.value
        self.parentApp.switchForm("Hal's")


class HalsTUI(npyscreen.Form):
    def activate(self):
        self.edit()

    def create(self):
        self.scale = self.add(npyscreen.TitleFixedText, name="Dave thinks you are a:")
        self.d = self.add(npyscreen.TitleFixedText, name="Dave started hating you on ")
        self.pre = self.add(npyscreen.TitleFixedText, name="Dave prefers")
        self.favfile = self.add(npyscreen.TitleFixedText, name="Dave's favorite file is: ")


if __name__ == "__main__":
    npyscreen.wrapper(ExampleTUI().run())
    