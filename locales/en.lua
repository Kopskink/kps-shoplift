local Translations = {
	info = {
		takingstuff = "Taking stuff...",
        afraid = "You are afraid that the shopkeeper will see you!",
		citynopolice = "You don't want to steal without the police",
	},
	target = {
		shoplift = "Grab stuff",
	},
	dispatch = {
		message = "Shoplifting",
	},
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
