package ru.javawebinar.topjava.repository.mock;

import ru.javawebinar.topjava.AuthorizedUser;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.repository.MealRepository;
import ru.javawebinar.topjava.util.MealsUtil;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class InMemoryMealRepositoryImpl implements MealRepository {
    private Map<Integer, Meal> repository = new ConcurrentHashMap<>();
    private AtomicInteger counter = new AtomicInteger(0);

    {
        MealsUtil.MEALS.forEach(this::save);
    }

    @Override
    public Meal save(Meal meal) {
        if (meal.getUserId() == AuthorizedUser.id() && meal.isNew()) {
            meal.setId(counter.incrementAndGet());
        }
        repository.put(meal.getId(), meal);
        return meal;
    }

    @Override
    public void delete(int id) {
        if (repository.containsKey(id))
            repository.remove(id);
    }

    @Override
    public Meal get(int id) {
        if (repository.containsKey(id))
            return repository.get(id);
        return null;
    }

    //будут ли последние по времени записи наверху?
    @Override
    public Collection<Meal> getAll() {
        if (!repository.isEmpty())
            return repository.values().stream()
                    .sorted((Comparator.comparing(Meal::getDateTime)))
                    .collect(Collectors.toList());
        return Collections.emptyList();
    }
}
