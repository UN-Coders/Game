class Dialogue{
	float x, y, x2, y2;													/*Position dialogue box*/
	JSONObject cDialogue;												/*Complete Dialogues*/
	JSONArray text;														/*Each Line of dialogues*/
	JSONArray tempo;													/*Timing of each lines*/
	float dialogueSpeed;												/*Speed of the text*/
	String last = ".";													/*Protection*/
	int n = 0, t = 0, initMode = 1;
	void paint(String dia){
		try {
			if(dia == ".") {
			} else if(last != dia){
				init(dia);
				last = dia;
			}else {	
				if(t < tempo.getInt(n) && tempo.get(n) != null){
					pushMatrix();
					rectMode(CORNERS);
					fill(200, 200);
					rect(x, y, x2, y2, 10);
					textAlign(LEFT, TOP);
					textSize(48);
					fill(10);
					text(text.getString(n), x+width/40, y+height/40, x2, y2);
					popMatrix();
					t += dialogueSpeed*skip;
				} else {
					n++;
					t = 0;
				}
			}
		} catch (Exception e) {											/*End of text*/
			n = 0;
			dialogue = ".";
		}
	}
	void resize(){
		this.x = width/30;
		this.y = height*3/4;
		this.x2 = width-width/30;
		this.y2 = height-height/30;
	}
	void init(String dial){
		text = cDialogue.getJSONArray(dial);
		tempo = cDialogue.getJSONArray(dial+"Tempos");
	}
	Dialogue () {
		this.x = width/30;
		this.y = height*3/4;
		this.x2 = width-width/30;
		this.y2 = height-height/30;
		this.dialogueSpeed = 1;
		this.cDialogue = loadJSONObject("Dialogues/Dialogues.json");
	}
}