package me.nextgeneric.metro.command.type;

import me.nextgeneric.metro.command.Command;
import me.nextgeneric.metro.command.arguments.Arguments;

import java.util.Collections;
import java.util.List;

public enum AbsentCommand implements Command {

    INSTANCE;

    @Override
    public List<String> aliases() {
        return Collections.emptyList();
    }

    @Override
    public String execute(Arguments args) {
        return "Unknown command!";
    }
}
