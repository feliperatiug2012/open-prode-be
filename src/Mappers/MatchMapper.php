<?php
    namespace OpenFixture\Mappers;

    use OpenFixture\Entities\MatchEntity;
    use OpenFixture\Exceptions\DataBaseInsertException;
    use OpenFixture\Exceptions\DataBaseUpdateException;
    use OpenFixture\Exceptions\NotImplementedException;

class MatchMapper extends Mapper {

    /*
     * @return array|void
	 * @throws NotImplementedException
     */
    public function list(){

    }

	/**
	 * @param $entity
	 * @return bool|int
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
    }
    
    /**
     * @param int $id
     * @return bool|void
     */
    public function delete( $id ){

    }

	/**
	 * @param $filter String | null
	 * @param $id integer | null
	 * @return array
	 * @throws NotImplementedException
	 */
    public function view($filter, $id=null){
    	throw new NotImplementedException("Funcion no implementada por el momento");
    }

}