<?php
    namespace OpenFixture\Mappers;

    use OpenFixture\Entities\MatchEntity;
	use OpenFixture\Exceptions\NotImplementedException;
	use \InvalidArgumentException;
	use OpenFixture\Mappers\Mapper;

class MatchMapper extends mapper {

    /*
     * @return array|void
	 * @throws NotImplementedException
     */
    public function list(){

    }

    /**
     * @param $entity
	 * @return bool|int|void
	 * @throws NotImplementedException
	 */
	public function save($entity){
        $matchEntity=new MatchEntity($entity,$this->db);
        try {
            return $matchEntity->save();
        }catch (DataBaseInsertException $e){
                return false;
            }
        catch (DataBaseUpdateException $e){
            return false;
        }
        throw new NotImplementedException();
    }
    
    /**
     * @param int $id
     * @return bool|void
     */
    public function delete( $id ){

    }
    
    /**
     * @param  $id
     * @return array | null
     * @throws NotImplementedException
     */
    public function view($id,$param=NULL){

    }

}