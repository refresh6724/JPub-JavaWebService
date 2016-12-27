import info.thecodinglive.JPAMain;
import info.thecodinglive.repository.TodoRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.test.SpringApplicationContextLoader;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import info.thecodinglive.model.TodoEntity;

import java.util.List;
import static org.assertj.core.api.Assertions.assertThat;

/**
 * Created by yun_dev1 on 2016-09-22.
 */

@SpringBootTest(classes=JPAMain.class)
@RunWith(SpringRunner.class)
@DataJpaTest
public class TodoRepoTest {
    //@Autowired
    //private TestEntityManager entityManager;

    @Autowired
    private TodoRepository todoRepository;

    @Test
    public void findTodoTItle(){
        //this.entityManager.persist(new TodoEntity("운동"));

        //List<TodoEntity> resultList  = todoRepository.findByTitle("운동");

        TodoEntity todoEntity = new TodoEntity("운동");


        todoRepository.save(todoEntity);

        System.out.println(todoRepository.findOne(1L));

    }
}