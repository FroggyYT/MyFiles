var output = [];
var footer = document.getElementById("footer");
footer.innerHTML += "<div id='custom'></div>";
var letterLookup = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
RPUI.use(["readingHeaders", "story"], mod => {
	var storyData = mod.story.getStoryData();
	for (questionIdx in storyData.questionList) {
		var question = storyData.questionList[questionIdx];
		output.push([]);
		if (question.type == 9) {
			for (e of question.excerptList) {
				for (s of e.sectionList) {
					for (p of s.paragraphList) {
						for (c of p.sentenceList) {
							if (c.clue == true) {
								var sentence = "";
								for (w of c.words) {
									sentence += `${w} `;
								}
								output[output.length - 1].push(sentence);
							}
						}
					}
				}
			}
			continue;
		}

		var hashes = mod.readingHeaders.parseAndLogStudent(question);
		for (h of question.b) {
			var index = hashes.indexOf(h);
			if (index != -1) {
				output[output.length - 1].push(`${letterLookup[index]}`);
			}
		}
	}
});

function getAnswers () {
	var children = Array.from(document.getElementsByClassName("progress")[0].children);
	var currentQuestion = -1;
	var container = document.getElementById("custom");
	for (var i in children) {
		if (((children[i].className == "current" &&
			!(/partial/.test(children[i].className)) &&
			!(/incorrect/.test(children[i].className))) ||
			children[i].className == "") &&
			currentQuestion == -1) {

			currentQuestion = i;

		}
	}
	custom.innerHTML = output[currentQuestion];
}

setInterval(getAnswers, 100);
