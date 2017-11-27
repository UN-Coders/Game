class Ally extends Mob{
	Table inventory,stats,habilities;
	TableRow rowInventory,rowStats,rowHabilities;

	void init(){
		inventory=loadTable("Saves/1/Ally/1/ally1Inventory.csv","header");
		stats=loadTable("Saves/1/Ally/1/ally1Stats.csv","header");
		habilities=loadTable("Saves/1/Ally/1/ally1Habilities.csv","header");
		rowHabilities=habilities.getRow(0);
		rowInventory=inventory.getRow(0);
		rowStats=stats.getRow(0);
	}
	Ally(String type, String saveSlot){
		super(type,saveSlot);
	}
}